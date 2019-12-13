// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class LoggingServiceTests: TestCase {

    func testService() throws {
        // given
        let sut = ConsoleLoggingService()

        // when
        sut.todo("todo")
        sut.verbose("verbose")
        sut.debug("debug")
        sut.info("info")
        sut.warning("warning")
        sut.error("error")

        // then
        // any way to get at console contents here?
    }
}
