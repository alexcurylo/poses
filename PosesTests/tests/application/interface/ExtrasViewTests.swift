// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class ExtrasViewTests: TestCase {

    func testExtras() throws {
        // given
        let sut = ExtrasView()

        // when
        sut.sendFeedback()
        sut.postReview()
        sut.visitPhotographyTips()

        // then
        XCTAssertEqual(appSpy.invokedLaunchCount, 2)
    }
}
