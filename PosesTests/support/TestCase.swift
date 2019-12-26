// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

class TestCase: XCTestCase {

    // swiftlint:disable implicitly_unwrapped_optional
    var appSpy: ApplicationServiceSpy!
    var dataSpy: DataServiceSpy!
    var logSpy: LoggingServiceSpy!
    var reportSpy: ReportingServiceSpy!
    // swiftlint:enable implicitly_unwrapped_optional

    override func setUp() {
        super.setUp()

        appSpy = ApplicationServiceSpy()
        ServiceProviderInstances.appServiceInstance = appSpy
        dataSpy = DataServiceSpy()
        ServiceProviderInstances.dataServiceInstance = dataSpy
        logSpy = LoggingServiceSpy()
        ServiceProviderInstances.logServiceInstance = LoggingServiceSpy()
        reportSpy = ReportingServiceSpy()
        ServiceProviderInstances.reportServiceInstance = ReportingServiceSpy()
    }

    override func tearDown() {
        appSpy = nil
        ServiceProviderInstances.appServiceInstance = appSpy
        dataSpy = nil
        ServiceProviderInstances.dataServiceInstance = dataSpy
        logSpy = nil
        ServiceProviderInstances.logServiceInstance = LoggingServiceSpy()
        reportSpy = nil
        ServiceProviderInstances.reportServiceInstance = ReportingServiceSpy()

        super.tearDown()
    }

    func wait(for seconds: TimeInterval) {
        let wait = XCTestExpectation(description: "wait")
        _ = XCTWaiter.wait(for: [wait], timeout: seconds)
    }
}
