// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
@objc(POSModelGroup) public final class POSModelGroup: NSManagedObject {

    /// Whether is special trash group
    var isTrash: Bool { name == L.groupTrash() }

    /// Add numeric suffix to title if required for uniqueness
    func set(unique title: String) {
        guard
            !title.isEmpty,
            title != name,
            let moc = managedObjectContext
        else { return }

        var unique = title
        var suffix = 2
        while moc.exists(template: "Group",
                         subs: ["named": unique]) {
            unique = "\(title)\(suffix)"
            suffix += 1
        }

        objectWillChange.send()
        name = unique
    }
}

extension POSModelGroup: GroupRowModel {

    var title: String { name ?? "" }

    /// Display count
    func visible(in moc: NSManagedObjectContext) -> String {
        String(moc.count(template: "VisiblePosesInGroup",
                         subs: ["named": id]))
    }
}

extension POSModelGroup: EntityNamable {

    /// name of entity in store
    static var entityName = "Group"
}

extension POSModelGroup: Identifiable {

    public var id: String {
        name ?? "" // is called after delete, apparently
    }
}
