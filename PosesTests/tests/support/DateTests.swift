// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class DateTests: TestCase {

    func testTimeConversion() {
        // given
        let sut = Date()
        let when = sut.timeIntervalSinceReferenceDate
        let diff = TimeInterval(TimeZone.current.secondsFromGMT(for: sut))

        // when
        let local = sut.toLocalTime.timeIntervalSinceReferenceDate
        let utc = sut.toUTC.timeIntervalSinceReferenceDate

        // then
        XCTAssertEqual(when - utc, diff)
        XCTAssertEqual(when - local, -diff)
    }

    func testStampTime() throws {
        // given
        let sut = DateFormatter.stampTime
        let date = Date(timeIntervalSinceReferenceDate: 0).toUTC

        // when
        let actual = sut.string(from: date)

        // then
        XCTAssertEqual(actual, "01.01.01 00:00:00.000")
    }
}
