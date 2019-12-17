// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
public final class Group: NSManagedObject {

    /// Whether is special trash group
    var isTrash: Bool { name == NSLocalizedString("TRASH", comment: "") }

    /// Display count
    var visible: String { "TODO" }
}
