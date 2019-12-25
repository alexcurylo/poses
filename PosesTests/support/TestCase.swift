// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

class TestCase: XCTestCase {

    override class func setUp() {
        super.setUp()
        guard ServiceProviderInstances.appServiceInstance == nil else { return }

        ServiceProviderInstances.appServiceInstance = ApplicationServiceSpy()
        ServiceProviderInstances.dataServiceInstance = DataServiceSpy()
        ServiceProviderInstances.logServiceInstance = LoggingServiceSpy()
        ServiceProviderInstances.reportServiceInstance = ReportingServiceSpy()
    }

    func wait(for seconds: TimeInterval) {
        let wait = XCTestExpectation(description: "wait")
        _ = XCTWaiter.wait(for: [wait], timeout: seconds)
    }
}
