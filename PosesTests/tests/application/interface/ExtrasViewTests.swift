// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class ExtrasViewTests: TestCase {

    func testExtras() throws {
        // given
        let sut = ExtrasView()

        // when
        sut.visitPhotographyTips()

        // then
        XCTAssertTrue(true)
    }
}
