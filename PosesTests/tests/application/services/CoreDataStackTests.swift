// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class CoreDataStackTests: TestCase {

    func testCoreData() throws {
        // given
        let sut = CoreDataStack()
        let loaded = expectation(description: "loaded")
        loaded.expectedFulfillmentCount = 2
        sut.loaded = { _, _ in loaded.fulfill() }

        // when
        let moc = sut.moc
        let result = XCTWaiter.wait(for: [loaded], timeout: 5)

        // then
        XCTAssertEqual(result, .completed)
        XCTAssertFalse(moc.hasChanges)
    }

    func testSeed() throws {
        // given
        let expected = Set<String>([
            POSModelCategory.entityName,
            POSModelGroup.entityName,
            POSModelPack.entityName,
            POSModelPose.entityName,
        ])
        let sut = CoreDataStack()
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
        let moc = sut.moc
        let result = XCTWaiter.wait(for: [loadedLibrary, loadedDocs], timeout: 5)
        XCTAssertEqual(result, .completed)

        let mom = sut.mom
        let entities = mom.entitiesByName
        let names = Set<String>(entities.keys)
        XCTAssertEqual(names, expected)

        let groups = try moc.fetch(POSModelGroup.request)
        let poses = try moc.fetch(POSModelPose.request)

        // then
        XCTAssertGreaterThanOrEqual(groups.count, 2)
        XCTAssertEqual(poses.count, 99 * 12 + 191) // = 1379
    }
}
