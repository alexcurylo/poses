// @copyright Trollwerks Inc.

import UIKit

/// Convenience for localizable string typesafe access
typealias L = R.string.localizable
// swiftlint:disable:previous type_name

extension String {

    /// Return filename from a path
    var file: String {
        let pieces = components(separatedBy: "/")
        return pieces[pieces.count - 1]
    }
}

extension String: LocalizedError {

    /// Treat a String as self documenting Error
    public var errorDescription: String? { return self }
}
