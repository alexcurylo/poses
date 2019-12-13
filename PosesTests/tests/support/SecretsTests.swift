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

    func testProduction() throws {
        XCTAssertNotEqual(Secrets.sbAppID.secret, "MISSING")
        XCTAssertNotEqual(Secrets.sbAppSecret.secret, "MISSING")
        XCTAssertNotEqual(Secrets.sbEncryptionKey.secret, "MISSING")
    }

    func testInjection() throws {
        // when
        Secrets.inject(secrets: nil)

        // then
        XCTAssertEqual(Secrets.sbAppID.secret, "MISSING")
        XCTAssertEqual(Secrets.sbAppSecret.secret, "MISSING")
        XCTAssertEqual(Secrets.sbEncryptionKey.secret, "MISSING")
    }
}
