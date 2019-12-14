// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class LaunchHandlerTests: TestCase {

    func testProduction() throws {
        // given
        let sut = LaunchHandler()

        // when
        let will = sut.application(UIApplication.shared,
                                   willFinishLaunchingWithOptions: [:])
        let did = sut.application(UIApplication.shared,
                                  didFinishLaunchingWithOptions: [:])
        sut.configure(logging: true)

        // then
        XCTAssertTrue(will)
        XCTAssertTrue(did)
    }
}
