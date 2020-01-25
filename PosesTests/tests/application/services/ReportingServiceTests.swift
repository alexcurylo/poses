// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class ReportingServiceTests: TestCase {

    func testReports() throws {
        // given
        let sut = FlurryReportingService()

        // when
        sut.event(.postReview)
        sut.start(.restorePurchases)
        sut.finish(.sendFeedback)
        sut.event(.showReleaseNotes)
        sut.event(.visitPhotographyTips)
        sut.screen("test")
        sut.breadcrumb("test")
        sut.error("test", id: "test", message: "test", params: [:])
    }
}
