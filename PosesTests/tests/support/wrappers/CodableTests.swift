// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class CodableTests: XCTestCase {

    private struct Values: Codable {

        @UnitInterval var unitInterval: Double = 3
    }

    func testCodable() throws {
        let string = """
            { "unitInterval": 4.0, "ph": 22 }
        """

        let data = try unwrap(string.data(using: .utf8))
        let values = try JSONDecoder().decode(Values.self, from: data)
        XCTAssertEqual(values.unitInterval, 1.0)

        let encoded = try JSONEncoder().encode(values)
        let jsonString = String(data: encoded, encoding: .utf8)
        XCTAssertEqual(jsonString, "{\"unitInterval\":1}")
    }
}
