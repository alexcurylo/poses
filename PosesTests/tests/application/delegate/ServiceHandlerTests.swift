// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class ServiceHandlerTests: TestCase {

    func testNoUnitTestingServices() throws {
        XCTAssertNil(ServiceHandler.services)
    }

    func testProduction() throws {
        // given
        let sut = ServiceHandler()

        // when
        let will = sut.application(UIApplication.shared,
                                   willFinishLaunchingWithOptions: [:])
        let did = sut.application(UIApplication.shared,
                                  didFinishLaunchingWithOptions: [:])

        // then
        XCTAssertTrue(will)
        XCTAssertTrue(did)
    }
}
