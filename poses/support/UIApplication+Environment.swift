// @copyright Trollwerks Inc.

import AVFoundation
import UIKit

extension UIApplication {

    /// Executing in background?
    var isBackground: Bool {
        applicationState != .active
    }

    /// Executing in foreground?
    var isForeground: Bool {
        applicationState == .active
    }

    /// Executing in production environment?
    static var isProduction: Bool {
        !isTesting
    }

    /// Executing in simulator?
    static var isSimulator: Bool {
        #if targetEnvironment(simulator)
        return true
        #else
        return false
        #endif
    }

    /// Executing under fastlane screenshotting?
    static var isTakingScreenshots: Bool {
        ProcessInfo.arguments(contain: .takingScreenshots)
    }

    /// Executing in test environment?
    static var isTesting: Bool {
        isUITesting || isUnitTesting
    }

    /// Executing in UI test environment?
    static var isUITesting: Bool {
        ProcessInfo.arguments(contain: .uiTesting)
    }

    /// Executing in unit test environment?
    static var isUnitTesting: Bool {
        NSClassFromString("XCTestCase") != nil
    }

    /// Current key window
    static var key: UIWindow? {
        Self.shared.windows.first { $0.isKeyWindow }
    }

    /// UI orientation
    static func interfaceOrientation(window: UIWindow? = key) -> UIInterfaceOrientation? {
        window?.windowScene?.interfaceOrientation
    }

    /// Camera orientation
    static func captureOrientation(window: UIWindow? = key) -> AVCaptureVideoOrientation? {
        AVCaptureVideoOrientation(interface: Self.interfaceOrientation(window: window))
    }
}

// MARK: - Camera support

extension AVCaptureVideoOrientation {

    /// Convert from UIWindowScene.interfaceOrientation
    init?(interface: UIInterfaceOrientation?) {
        switch interface {
        case .landscapeRight: self = .landscapeRight
        case .landscapeLeft: self = .landscapeLeft
        case .portrait: self = .portrait
        case .portraitUpsideDown: self = .portraitUpsideDown
        case .unknown, .none: return nil
        @unknown default: return nil
        }
    }
}

// MARK: - Development

extension UIApplication {

    #if DEBUG
    /// Development aid for clearing device cache
    static func clearLaunchScreenCache() {
        let cache = NSHomeDirectory()+"/Library/SplashBoard"
        // swiftlint:disable:next force_try
        try! FileManager.default.removeItem(atPath: cache)
    }
    #endif
}
