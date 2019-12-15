// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class SecretsTests: TestCase {

    private let secrets = Bundle.main.url(forResource: "Secrets",
                                          withExtension: "plist")

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        Secrets.inject(secrets: secrets)
        super.tearDown()
    }

    func testFixtureInjection() throws {
        // given
        let fixture = Bundle.main.url(forResource: "TestSecrets",
                                      withExtension: "plist")

        // when
        Secrets.inject(secrets: fixture)

        // then
        XCTAssertNotEqual(Secrets.flurryApiKey.secret, "MISSING")
        XCTAssertNotEqual(Secrets.sbAppId.secret, "MISSING")
        XCTAssertNotEqual(Secrets.sbAppSecret.secret, "MISSING")
        XCTAssertNotEqual(Secrets.sbEncryptionKey.secret, "MISSING")
    }

    func testNilInjection() throws {
        // when
        Secrets.inject(secrets: nil)

        // then
        XCTAssertEqual(Secrets.flurryApiKey.secret, "MISSING")
        XCTAssertEqual(Secrets.sbAppId.secret, "MISSING")
        XCTAssertEqual(Secrets.sbAppSecret.secret, "MISSING")
        XCTAssertEqual(Secrets.sbEncryptionKey.secret, "MISSING")
    }
}
