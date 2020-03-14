// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// Something that exposes an order
protocol Orderable {

    /// Numeric order
    var order: Int32 { get set }
}

extension FetchedResults where Result: NSManagedObject {

    /// Delete offsets and fix order
    func delete(_ managedObjectContext: NSManagedObjectContext) -> (IndexSet) -> Void {
        func delete(_ offset: IndexSet) {
            var arr = Array(self)
            arr.remove(atOffsets: offset)

            let diff = arr.difference(from: self)
            for change in diff {
                switch change {
                case let .remove(_, element, _):
                    managedObjectContext.delete(element)
                    try? managedObjectContext.save()
                case .insert:
                    break
                }
            }
            // missing reorder?
        }

        return delete
    }
}

extension FetchedResults where Result: Orderable {

    /// Move offsets and fix order asynchromously
    func move(moc: NSManagedObjectContext) -> (IndexSet, Int) -> Void {
        func move(_ offset: IndexSet, _ destination: Int) {
            moc.perform {
                var arr = Array(self)
                arr.move(fromOffsets: offset, toOffset: destination)
                for index in 0..<arr.count {
                    arr[index].order = Int32(index)
                }
                try? moc.save()
            }
        }

        return move
    }
}
