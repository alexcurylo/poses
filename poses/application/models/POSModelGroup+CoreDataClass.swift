// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
@objc(POSModelGroup) public final class POSModelGroup: NSManagedObject, EntityModel {

    /// EntityModel conformance
    typealias Entity = POSModelGroup

    /// Whether is special trash group
    var isTrash: Bool { name == NSLocalizedString("TRASH", comment: "") }

    /// Display count
    var visible: String { "TODO" }
}
