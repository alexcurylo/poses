// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class StringTests: TestCase {

    func testFile() {
        // given
        let path = "some/long/path/file.txt"
        let file = "file.pdf"
        let empty = ""

        // then
        XCTAssertEqual("file.txt", path.file)
        XCTAssertEqual("file.pdf", file.file)
        XCTAssertEqual("", empty.file)
    }

    func testError() {
        // given
        let error: LocalizedError = "test error"

        // then
        XCTAssertEqual("test error", error.errorDescription)
    }
}
