// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class FormattedTests: XCTestCase {

    @Formatted({ $0.capitalized }) private var string: String = "john"

    func testFormatted() {
        XCTAssertEqual(string, "John")
    }
}
