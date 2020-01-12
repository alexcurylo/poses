// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
public final class Group: NSManagedObject, EntityModel {

    /// EntityModel conformance
    typealias Entity = Group

    /// Whether is special trash group
    var isTrash: Bool { name == NSLocalizedString("TRASH", comment: "") }

    /// Display count
    var visible: String { "TODO" }
}
