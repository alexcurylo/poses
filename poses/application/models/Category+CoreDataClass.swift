// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
public final class Category: NSManagedObject, EntityModel {

    /// EntityModel conformance
    typealias Entity = Category

    /// Display title
    var title: String { NSLocalizedString(key!, comment: "") }
    // swiftlint:disable:previous force_unwrapping

    /// Display count
    var visible: String { "TODO" }
}
