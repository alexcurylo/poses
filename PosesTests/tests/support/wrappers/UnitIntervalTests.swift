// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class UnitIntervalTests: XCTestCase {

    @UnitInterval private var value: Double = -0.2

    func testUnitInterval() {
        XCTAssertEqual(value, 0)
        value = -10
        XCTAssertEqual(value, 0)
        value = 0.8
        XCTAssertEqual(value, 0.8)
        value = 1.2
        XCTAssertEqual(value, 1.0)
    }
}
