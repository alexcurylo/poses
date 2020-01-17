// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class DataServiceTests: TestCase {

    func testCoreData() throws {
        // given
        let sut = DataServiceImpl()
        let loaded = expectation(description: "loaded")
        loaded.expectedFulfillmentCount = 2
        sut.loaded = { _, _ in loaded.fulfill() }

        // when
        let context = sut.viewContext
        sut.save()
        let result = XCTWaiter.wait(for: [loaded], timeout: 5)

        // then
        XCTAssertEqual(result, .completed)
        XCTAssertFalse(context.hasChanges)
    }

    func testStub() throws {
        // given
        let sut = DataServiceStub()

        // when
        let context = sut.viewContext
        sut.save()

        // then
        XCTAssertFalse(context.hasChanges)
    }

    func testSeed() throws {
        // given
        let expected = Set<String>([
            POSModelCategory.entityName,
            POSModelGroup.entityName,
            POSModelPack.entityName,
            POSModelPose.entityName
        ])
        let sut = DataServiceImpl()
        let loadedLibrary = expectation(description: "loadedLibrary")
        let loadedDocs = expectation(description: "loadedDocs")
        sut.loaded = { storeDescription, error in
            if let error = error {
                XCTFail("loading error: \(error)")
            }
            let path = "\(storeDescription.debugDescription)"
            if path.contains("Documents") {
                loadedDocs.fulfill()
            } else if path.contains("Library/Application%20Support") {
                loadedLibrary.fulfill()
            } else {
                XCTFail("unexpected store: \(path)")
            }
        }

        // when
        let moc = sut.viewContext
        let result = XCTWaiter.wait(for: [loadedLibrary, loadedDocs], timeout: 5)
        XCTAssertEqual(result, .completed)

        let mom = sut.persistentContainer.managedObjectModel
        let entities = mom.entitiesByName
        let names = Set<String>(entities.keys)
        XCTAssertEqual(names, expected)

        let groups = try moc.fetch(POSModelGroup.request)
        let poses = try moc.fetch(POSModelPose.request)

        // then
        XCTAssertEqual(groups.count, 0)
        XCTAssertEqual(poses.count, 99 * 12 + 191) // = 1379
    }
}
