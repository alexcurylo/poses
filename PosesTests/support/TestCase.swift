// @copyright Trollwerks Inc.

@testable import Poses_Pro
import XCTest

class TestCase: XCTestCase {

    override class func setUp() {
        super.setUp()
        guard ServiceProviderInstances.dataServiceInstance == nil else { return }

        ServiceProviderInstances.dataServiceInstance = DataServiceSpy()
        ServiceProviderInstances.logServiceInstance = LoggingServiceSpy()
    }
}
