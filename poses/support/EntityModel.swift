// @copyright Trollwerks Inc.

import CoreData
import Foundation

/// Core Data conveniences
protocol EntityModel {

    /// The entity this is extending
    associatedtype Entity: NSManagedObject

    /// name of entity in store
    static var entityName: String { get }
}

extension EntityModel {

    /// default name of entity in store, matching class
    static var entityName: String {
        String(describing: Entity.self)
    }

    /// Xcode-generated `fetchRequest()` is ambiguous
    static var request: NSFetchRequest<Entity> {
        NSFetchRequest<Entity>(entityName: entityName)
    }
}
