// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class ConstrainedTests: XCTestCase {

    @Constrained(0...14) private var value: Int = -1

    func testConstrained() {
        XCTAssertEqual(value, 0)
        value = -10
        XCTAssertEqual(value, 0)
        value = 7
        XCTAssertEqual(value, 7)
        value = 20
        XCTAssertEqual(value, 14)
    }
}
