// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class DataServiceTests: TestCase {

    func testService() throws {
        // given
        let sut = DataServiceImpl()

        // when
        let context = sut.viewContext
        sut.save()

        // then
        XCTAssertFalse(context.hasChanges)
    }
}
