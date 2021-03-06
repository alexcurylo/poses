// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class UIApplicationTests: TestCase {

    func testAttributes() throws {
        XCTAssertFalse(UIApplication.isProduction)
        XCTAssertTrue(UIApplication.isSimulator)
        XCTAssertFalse(UIApplication.isTakingScreenshots)
        XCTAssertTrue(UIApplication.isTesting)
        XCTAssertFalse(UIApplication.isUITesting)
        XCTAssertTrue(UIApplication.isUnitTesting)
    }

    func testStates() throws {
        // given
        let sut = UIApplication.shared

        // then
        XCTAssertFalse(sut.isBackground)
        XCTAssertTrue(sut.isForeground)
    }

    func testClearLaunchScreenCache() {
        UIApplication.clearLaunchScreenCache()
    }

    func testSettings() {
        XCTAssertNil(ProcessInfo.setting(bool: .subscribed))
        XCTAssertNil(ProcessInfo.setting(string: .userName))
    }
}
