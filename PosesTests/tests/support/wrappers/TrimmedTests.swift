// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class TrimmedTests: XCTestCase {

    @Trimmed private var string: String = " Swift "

    func testTrimmed() {
        XCTAssertEqual(string, "Swift")
        string = " "
        XCTAssertTrue(string.isEmpty)
    }
}
