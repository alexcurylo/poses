// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class AppViewTests: TestCase {

    func testPreviews() throws {
        XCTAssertTrue(AppView_Previews.previews is AppView)
        XCTAssertEqual(AppView_Previews.platform, .iOS)
    }
}
