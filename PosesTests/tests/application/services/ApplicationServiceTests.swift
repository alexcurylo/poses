// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class ApplicationServiceTests: TestCase {

    func testService() throws {
        // given
        let sut = UIApplication.shared
        let url = try XCTUnwrap(URL(string: "test"))
        StringKey.configureSettingsDisplay()

        // when
        sut.launch(url: url)
        sut.route(to: .tab(.gallery))
        sut.endEditing()
        let version = sut.version

        // then
        XCTAssertFalse(version.isEmpty)
    }
}
