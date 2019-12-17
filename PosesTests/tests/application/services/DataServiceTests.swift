// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class DataServiceTests: TestCase {

    func testCoreData() throws {
        // given
        let sut = DataServiceImpl()
        let loaded = expectation(description: "loaded")
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
}
