// @copyright Trollwerks Inc.

import Foundation

extension Date {

    /// Convert to current time zone
    var toLocalTime: Date {
        let timezone = TimeZone.current
        let seconds = TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }

    /// Convert to UTC time zone
    var toUTC: Date {
        let timezone = TimeZone.current
        let seconds = -TimeInterval(timezone.secondsFromGMT(for: self))
        return Date(timeInterval: seconds, since: self)
    }
}

extension DateFormatter {

    /// Format local times for timestamps
    static var stampTime = DateFormatter {
        $0.dateFormat = "yy.MM.dd HH:mm:ss.SSS"
        $0.calendar = Calendar(identifier: .iso8601)
        $0.timeZone = TimeZone.current
        $0.locale = Locale(identifier: "en_US_POSIX")
    }
}
