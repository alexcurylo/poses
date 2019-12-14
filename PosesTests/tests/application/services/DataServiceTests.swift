// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class DataServiceTests: TestCase {

    func testCoreData() throws {
        // given
        let sut = DataServiceImpl()

        // when
        let context = sut.viewContext
        sut.save()

        // then
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
