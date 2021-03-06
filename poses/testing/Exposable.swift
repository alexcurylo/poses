// @copyright Trollwerks Inc.

import UIKit

/// Exposes an item to UI tests
/// Intended as base class for screen based enums
protocol Exposable {

    /// Defaults to Type.self
    var identifier: String { get }
}

extension Exposable {

    /// accessibilityIdentifier for UI tests
    var identifier: String {
        "\(String(describing: type(of: self))).\(self)"
    }

    // Assign accessibility identifier to item
    // - Parameter item: Thing to expose
    // func expose(item: UIAccessibilityIdentification?) {
        // item?.accessibilityIdentifier = identifier
    // }
}

extension UIAccessibilityIdentification {

    // Assign accessibility identifier to ourselves
    // - Parameter exposable: Identifier provider
    // func expose(as exposable: Exposable?) {
        // accessibilityIdentifier = exposable?.identifier
    // }
}

/// Tagging protocol for view controllers
protocol Exposing {

    /// Conventional call for exposing selected UI once created
    func expose()
}

/// Tagging protocol for collection data sources
protocol CollectionCellExposing: AnyObject {

    /// Conventional call for exposing cell once created
    /// - Parameters:
    ///   - view: Container
    ///   - path: Will be encoded in accessibility identifier
    ///   - cell: Cell to expose
    func expose(view: UICollectionView,
                path: IndexPath,
                cell: UICollectionViewCell)
}

/// Tagging protocol for table data sources
protocol TableCellExposing: AnyObject {

    /// Conventional call for exposing cell once created
    /// - Parameters:
    ///   - view: Container
    ///   - path: Will be encoded in accessibility identifier
    ///   - cell: Cell to expose
    func expose(view: UITableView,
                path: IndexPath,
                cell: UITableViewCell)
}
