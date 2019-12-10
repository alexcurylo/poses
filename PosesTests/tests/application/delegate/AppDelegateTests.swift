// @copyright Trollwerks Inc.

@testable import Poses_Pro
import XCTest

final class AppDelegateTests: TestCase {

    func testUnitTestingHandlerList() throws {
        // given
        let expected: [String] = []

        // when
        let delegate = try XCTUnwrap(UIApplication.shared.delegate as? AppDelegate)
        let actual = delegate.handlers.map { String(describing: type(of: $0)) }

        // then
        XCTAssertEqual(expected, actual)
    }

    func testProductionHandlerList() {
        // given
        let expected = [
            String(describing: ServiceHandler.self),
            String(describing: LaunchHandler.self)
        ]

        // when
        let actual = AppDelegate.runtimeHandlers(for: .production)
                                .map { String(describing: type(of: $0)) }

        // then
        XCTAssertEqual(expected, actual)
    }

    func testUITestingHandlerList() {
        // given
        let expected = [
            String(describing: ServiceHandlerStub.self),
            String(describing: LaunchHandler.self)
        ]

        // when
        let actual = AppDelegate.runtimeHandlers(for: .uiTesting)
                                .map { String(describing: type(of: $0)) }

        // then
       XCTAssertEqual(expected, actual)
    }

    func testAppDelegateConfiguration() {
        let app = UIApplication.shared
        let delegate = app.delegate as? AppDelegate
        XCTAssertNotNil(delegate, "sharedApplication().delegate does not exist - set host application")

        XCTAssertTrue(UIApplication.isUnitTesting)
        XCTAssertFalse(UIApplication.isUITesting)
        XCTAssertTrue(UIApplication.isTesting)
        #if targetEnvironment(simulator)
        XCTAssertTrue(UIApplication.isSimulator)
        #else
        XCTAssertFalse(UIApplication.isSimulator)
        #endif
    }

    func testAppDelegateDelegation() {
        let app = UIApplication.shared
        guard let delegate = app.delegate as? AppDelegate else {
            return XCTFail("unexpected app delegate class")
        }

        delegate.applicationWillResignActive(app)
        delegate.applicationDidEnterBackground(app)
        delegate.applicationWillEnterForeground(app)
        delegate.applicationDidBecomeActive(app)
        delegate.applicationWillTerminate(app)
    }

    func testUserDefaults() {
        let defaults = UserDefaults.standard
        StringKey.infoDictionarySettingsKeys.forEach { key in
            XCTAssertNotNil(defaults[key], "missing Settings display key: \(key)")
        }
    }

    func testInfoPlist() {
        guard let infoPlist = Bundle.main.infoDictionary else {
            return XCTFail("missing infoDictionary")
        }

        XCTAssertNotNil(infoPlist["ITSAppUsesNonExemptEncryption"])
        XCTAssertNotNil(infoPlist["NSCameraUsageDescription"])
        XCTAssertNotNil(infoPlist["NSPhotoLibraryAddUsageDescription"])
        XCTAssertNotNil(infoPlist["NSPhotoLibraryUsageDescription"])
    }

    func testResources() throws {
        try R.validate()
    }
}
