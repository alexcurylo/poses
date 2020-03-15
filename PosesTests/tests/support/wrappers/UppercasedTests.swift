// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class UppercasedTests: XCTestCase {

    @Uppercased private var string: String = "swift"

    func testUppercased() {
        XCTAssertEqual(string, "SWIFT")
        string = "Swift"
        XCTAssertEqual(string, "SWIFT")
    }
}
