// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// Provider of application-wide services
protocol ServiceProvider {

    /// ApplicationService
    var app: ApplicationService { get }
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

    /// ApplicationService
    var app: ApplicationService {
        ServiceProviderInstances.appServiceInstance
    }

    /// DataService
    var data: DataService {
        ServiceProviderInstances.dataServiceInstance
    }

    /// LoggingService
    var log: LoggingService {
        ServiceProviderInstances.logServiceInstance
    }

    /// ReportingService
    var report: ReportingService {
        ServiceProviderInstances.reportServiceInstance
    }
}

/// To be set up at application startup time
enum ServiceProviderInstances {

    // swiftlint:disable implicitly_unwrapped_optional

    /// ApplicationService
    static var appServiceInstance: ApplicationService!
    /// DataService
    static var dataServiceInstance: DataService!
    /// LoggingService
    static var logServiceInstance: LoggingService!
    /// ReportingService
    static var reportServiceInstance: ReportingService!
}

/// Convenience for service injection, in-constructor operaionts, etc.
struct Services: ServiceProvider { }
