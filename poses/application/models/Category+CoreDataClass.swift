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

extension Category: Identifiable {
    // TaskList put id: UUID in the attributes and declared Identifiable
    // Core Data Test declared Identifiable without attribute
    // ShoppingList did `ForEach(items, id: \.objectID) and didn't declare Identifiable
    // BlogIdeaList declared Identifiable without attribute, has updating "ForEach(self.blogIdeas, id: \.ideaTitle)," note
    // https://stackoverflow.com/questions/57405435/how-to-transform-array-of-core-data-managed-objects-into-an-identifiable-list
}
