// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

class TestCase: XCTestCase {

    override class func setUp() {
        super.setUp()
        guard ServiceProviderInstances.dataServiceInstance == nil else { return }

        ServiceProviderInstances.dataServiceInstance = DataServiceSpy()
        ServiceProviderInstances.logServiceInstance = LoggingServiceSpy()
    }

    func wait(for seconds: TimeInterval) {
        let wait = XCTestExpectation(description: "wait")
        _ = XCTWaiter.wait(for: [wait], timeout: seconds)
    }
}
