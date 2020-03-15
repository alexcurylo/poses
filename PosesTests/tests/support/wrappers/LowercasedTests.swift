// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class LowercasedTests: XCTestCase {

    @Lowercased private var string: String = "SWIFT"

    func testLowercased() {
        XCTAssertEqual(string, "swift")
        string = "Swift"
        XCTAssertEqual(string, "swift")
    }
}
