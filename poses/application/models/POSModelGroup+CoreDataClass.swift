// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
@objc(POSModelGroup) public final class POSModelGroup: NSManagedObject {

    /// Whether is special trash group
    var isTrash: Bool { name == NSLocalizedString("TRASH", comment: "") }

    /// Display count
    var visible: String { "TODO" }
}

extension POSModelGroup: EntityModel {

    /// EntityModel conformance
    typealias Entity = POSModelGroup

    /// name of entity in store
    static var entityName = "Group"
}
