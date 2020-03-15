// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class CapitalizedTests: XCTestCase {

    @Capitalized private var string: String = "swift"

    func testCapitalized() {
        XCTAssertEqual(string, "Swift")
        string = "SWIFT"
        XCTAssertEqual(string, "Swift")
    }
}
