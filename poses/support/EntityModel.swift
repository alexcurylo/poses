// @copyright Trollwerks Inc.

import CoreData
import Foundation

/// Core Data conveniences
protocol EntityModel {

    /// The entity this is extending
    associatedtype Entity: NSManagedObject
}

extension EntityModel {

    private static var name: String {
        String(describing: Entity.self)
    }

    /// Apply required disambiguation
    static var request: NSFetchRequest<Entity> {
        NSFetchRequest<Entity>(entityName: name)
    }
}
