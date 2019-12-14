// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class LaunchHandlerTests: TestCase {

    func testProductionHandler() throws {
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

    func testLaunchSetting() throws {
        // given
        let settings: [LaunchSetting] = [
            .fullAccess(true),
            .userName("test")
        ]

        // then
        settings.forEach {
            XCTAssertFalse($0.key.isEmpty)
            XCTAssertFalse($0.value.isEmpty)
            XCTAssertFalse($0.setting.isEmpty)
        }
    }
}
