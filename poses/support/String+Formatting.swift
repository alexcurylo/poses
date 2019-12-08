// @copyright Trollwerks Inc.

import UIKit

/// Convenience for localizable string typesafe access
typealias L = R.string.localizable
// swiftlint:disable:previous type_name

extension String {

    /// Return filename from a path
    var file: String {
        return components(separatedBy: "/").last ?? ""
    }

    /// Truncates the string to the specified length number of characters
    /// and appends an optional trailing string if longer.
    /// - Parameters:
    ///   - length: Desired maximum length of a string
    ///   - trailing: A 'String' that will be appended after the truncation
    /// - Returns: Truncated String
    func truncate(length: Int,
                  trailing: String = "…") -> String {
        return (count > length) ? prefix(length) + trailing : self
    }

    /// Initialize with StaticString such as `#file`
    /// - Parameter staticString: Compile time string
    init(_ staticString: StaticString) {
        self = staticString.withUTF8Buffer {
            String(decoding: $0, as: UTF8.self)
        }
    }
}

extension String: LocalizedError {

    /// Treat a String as self documenting Error
    public var errorDescription: String? { return self }
}

extension StringProtocol {

    /// Allow string subscripting by Int closed range
    /// - Parameter bounds: Range to subscript
    subscript(bounds: CountableClosedRange<Int>) -> SubSequence {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }

    /// Allow string subscripting by Int range
    /// - Parameter bounds: Range to subscript
    subscript(bounds: CountableRange<Int>) -> SubSequence {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(start, offsetBy: bounds.count)
        return self[start..<end]
    }
}
