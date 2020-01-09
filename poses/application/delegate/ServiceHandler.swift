// @copyright Trollwerks Inc.

import UIKit

/// Stub for startup construction
struct ServiceHandler: AppHandler {

    /// Global accessor
    static var services: ServiceHandler? {
        RoutingAppDelegate.handler(type: Self.self)
    }
}

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

        ServiceProviderInstances.appServiceInstance = UIApplication.shared
        ServiceProviderInstances.dataServiceInstance = DataServiceImpl()
        ServiceProviderInstances.reportServiceInstance = FlurryReportingService()

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
        true
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

        ServiceProviderInstances.appServiceInstance = UIApplication.shared
        ServiceProviderInstances.dataServiceInstance = DataServiceStub()
        ServiceProviderInstances.reportServiceInstance = ReportingServiceStub()

        return true
    }

    /// :nodoc:
    func application(
        _ application: UIApplication,
        // swiftlint:disable:next discouraged_optional_collection
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        true
    }
}
#endif
