// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class ContentViewTests: TestCase {

    func testPreviews() throws {
        // given
        let sut = ContentView_Previews.previews
        let expected = "ModifiedContent<ContentView, _EnvironmentKeyWritingModifier<NSManagedObjectContext>>"

        // when
        let actual = "\(type(of: sut))"

        // then
        XCTAssertEqual(expected, actual)
        XCTAssertEqual(ContentView_Previews.platform, .iOS)
    }
}
