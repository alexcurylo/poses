// @copyright Trollwerks Inc.

import UIKit

/// Stub for startup construction
struct ServiceHandler: AppHandler { }

extension ServiceHandler: AppLaunchHandler {

    /// willFinishLaunchingWithOptions handler
    /// - Parameters:
    ///   - application: UIApplication
    ///   - launchOptions: Options
    /// - Returns: Success
    func application(
        _ application: UIApplication,
        // swiftlint:disable:next discouraged_optional_collection
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        // other services may log
        ServiceProviderInstances.logServiceInstance = SwiftyBeaverLoggingService()

        ServiceProviderInstances.dataServiceInstance = DataServiceImpl()

        return true
    }

    /// didFinishLaunching handler
    /// - Parameters:
    ///   - application: UIApplication
    ///   - launchOptions: Options
    /// - Returns: Success
    func application(
        _ application: UIApplication,
        // swiftlint:disable:next discouraged_optional_collection
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }
}

// MARK: - Testing

#if DEBUG
/// :nodoc:
struct ServiceHandlerStub: AppLaunchHandler {

    /// :nodoc:
    func application(
        _ application: UIApplication,
        // swiftlint:disable:next discouraged_optional_collection
        willFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        // other services may log
        ServiceProviderInstances.logServiceInstance = ConsoleLoggingService()

        ServiceProviderInstances.dataServiceInstance = DataServiceStub()

        return true
    }

    /// :nodoc:
    func application(
        _ application: UIApplication,
        // swiftlint:disable:next discouraged_optional_collection
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        return true
    }
}
#endif
