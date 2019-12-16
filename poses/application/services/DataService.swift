// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// Provides stored data functionality
protocol DataService {

    /// viewContext
    var viewContext: NSManagedObjectContext { get }

    /// Write viewContext
    func save()
}

/// Production implementation of DataService
final class DataServiceImpl: DataService, ServiceProvider {

    /// :nodoc:
    var viewContext: NSManagedObjectContext { persistentContainer.viewContext }

    /// :nodoc:
    func save() {
        _ = try? saveContext()
    }

    // MARK: - Core Data stack

    private lazy var persistentContainer: NSPersistentCloudKitContainer = {
        let container = NSPersistentCloudKitContainer(name: "PosesModel")
        container.loadPersistentStores { storeDescription, error in
            self.log.verbose("Loaded CKC: \(storeDescription)")
            if let error = error {
                self.log.error("Load error: \(String(describing: error))")
            }
        }
        return container
    }()
}

// MARK: - Private

private extension DataServiceImpl {

    func saveContext() throws {
        let context = persistentContainer.viewContext
        //if context.hasChanges {
            try context.save()
        //}
    }
}

// MARK: - Testing

#if DEBUG

/// Stub for testing
struct DataServiceStub: DataService {

    let viewContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)

    func save() { }
}

#endif
