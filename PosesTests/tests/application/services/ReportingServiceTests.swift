// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class ReportingServiceTests: TestCase {

    func testReports() throws {
        // given
        let sut = FlurryReportingService()

        // when
        sut.event(.screen(name: "test"))
        sut.start(.screen(name: "test"))
        sut.finish(.screen(name: "test"))
        sut.screen("test")
        sut.breadcrumb("test")
        sut.error("test", id: "test", message: "test", params: [:])
    }
}
