// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
@objc(POSModelGroup) public final class POSModelGroup: NSManagedObject {

    /// Whether is special trash group
    var isTrash: Bool { name == L.groupTrash() }
}

extension POSModelGroup: GroupRowModel {

    var title: String { name ?? "" }

    /// Display count
    func visible(in moc: NSManagedObjectContext) -> String {
        moc.count(template: "VisiblePosesInGroup",
                  subs: ["named": id])
    }
}

extension POSModelGroup: EntityModel {

    /// EntityModel conformance
    typealias Entity = POSModelGroup

    /// name of entity in store
    static var entityName = "Group"
}

extension POSModelGroup: Identifiable {

    public var id: String {
        // swiftlint:disable:next force_unwrapping
        name!
    }
}
