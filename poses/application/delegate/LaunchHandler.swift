// @copyright Trollwerks Inc.

import SwiftyBeaver
import UIKit

/// Stub for startup construction
struct LaunchHandler: AppHandler { }

// MARK: - AppLaunchHandler

extension LaunchHandler: AppLaunchHandler {

    /// willFinishLaunchingWithOptions
    /// - Parameters:
    ///   - application: Application
    ///   - launchOptions: Launch options
    /// - Returns: Success
    func application(
        _ application: UIApplication,
        // swiftlint:disable:next discouraged_optional_collection
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        ProcessInfo.startup()

        return true
    }

    /// didFinishLaunchingWithOptions
    /// - Parameters:
    ///   - application: Application
    ///   - launchOptions: Launch options
    /// - Returns: Success
    func application(
        _ application: UIApplication,
        // swiftlint:disable:next discouraged_optional_collection
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        configureLogging()
        configureSettingsDisplay()

        return true
    }
}

// MARK: - Private

private extension LaunchHandler {

    func configureSettingsDisplay() {
        StringKey.configureSettingsDisplay()
    }
}

// MARK: - SwiftyBeaver
// https://docs.swiftybeaver.com

private let swiftyBeaver = SwiftyBeaver.self

/// Wraps SwiftyBeaver API
struct SwiftyBeaverLoggingService: LoggingService {

    /// Wrap point for log API integration
    /// - Parameters:
    ///   - level: LoggingLevel
    ///   - message: Describable autoclosure
    ///   - file: File marker
    ///   - function: Function marker
    ///   - line: Line marker
    ///   - context: If service requires such
    func custom(level: LoggingLevel,
                message: @autoclosure () -> Any,
                file: String,
                function: String,
                line: Int,
                context: Any?) {
        let sbLevel = SwiftyBeaver.Level(rawValue: level.rawValue) ?? .verbose
        swiftyBeaver.custom(level: sbLevel,
                            message: message(),
                            file: file,
                            function: function,
                            line: line,
                            context: context)
    }
}

private extension LaunchHandler {

    func configureLogging() {
        let console = ConsoleDestination()
        swiftyBeaver.addDestination(console)

        let file = FileDestination()
        if UIApplication.isSimulator {
            // tail -f /tmp/swiftybeaver.log
            file.logFileURL = URL(fileURLWithPath: "/tmp/swiftybeaver.log")
        }
        swiftyBeaver.addDestination(file)

        if UIApplication.isProduction {
            let platform = SBPlatformDestination(
                appID: Secrets.sbAppID.secret,
                appSecret: Secrets.sbAppSecret.secret,
                encryptionKey: Secrets.sbEncryptionKey.secret)
            swiftyBeaver.addDestination(platform)
        }
    }
}
