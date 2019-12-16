// @copyright Trollwerks Inc.

import UIKit

/// Provider of application-wide services
protocol ServiceProvider {

    /// DataService
    var data: DataService { get }
    /// LoggingService
    var log: LoggingService { get }
    /// ReportingService
    var report: ReportingService { get }
}

extension ServiceProvider {

    // override to return mocks/stubs
    // defaults set by ServiceHandler or ServiceHandlerSpy

    /// DataService
    var data: DataService {
        return ServiceProviderInstances.dataServiceInstance
    }

    /// LoggingService
    var log: LoggingService {
        return ServiceProviderInstances.logServiceInstance
    }

    /// ReportingService
    var report: ReportingService {
        return ServiceProviderInstances.reportServiceInstance
    }
}

/// To be set up at application startup time
enum ServiceProviderInstances {

    // swiftlint:disable implicitly_unwrapped_optional

    /// DataService
    static var dataServiceInstance: DataService!
    /// LoggingService
    static var logServiceInstance: LoggingService!
    /// ReportingService
    static var reportServiceInstance: ReportingService!
}

/// Convenience for service injection, in-constructor operaionts, etc.
struct Services: ServiceProvider { }
