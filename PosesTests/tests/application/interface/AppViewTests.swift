// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class AppViewTests: TestCase {

    func testPreviews() throws {
        // given
        let sut = AppView_Previews.previews
        let expected = "ModifiedContent<AppView, _EnvironmentKeyWritingModifier<NSManagedObjectContext>>"

        // when
        let actual = "\(type(of: sut))"

        // then
        XCTAssertEqual(expected, actual)
        XCTAssertEqual(AppView_Previews.platform, .iOS)
    }
}
