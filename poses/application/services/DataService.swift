// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// Provides stored data functionality
protocol DataService {

    var viewContext: NSManagedObjectContext { get }

    func save()
}

/// Production implementation of DataService
final class DataServiceImpl: DataService {

    var viewContext: NSManagedObjectContext { persistentContainer.viewContext }

    func save() {
        // Save changes in the application's managed object context when the application transitions to the background.
        saveContext()
    }

    // MARK: - Core Data stack

    private lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
        */
        let container = NSPersistentCloudKitContainer(name: "Poses")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.

                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created,
                 or disallows writing.
                 * The persistent store is not accessible, due to
                 permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo) for \(storeDescription)")
            }
        }
        return container
    }()
}

// MARK: - Private

private extension DataServiceImpl {

    // MARK: - Core Data Saving support

    func saveContext() {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
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
