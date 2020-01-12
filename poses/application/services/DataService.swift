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

extension DataService {

    /// Is the user subscribed?
    var isSubscribed: Bool {
        #if DEBUG
        if let subscribed = ProcessInfo.setting(bool: .subscribed) {
            return subscribed
        }
        #endif
        return false
    }
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

    /// :nodoc:
    var loaded: ((NSPersistentStoreDescription, Error?) -> Void)?

    private lazy var persistentContainer: NSPersistentContainer = {
        seed()
        //let container = NSPersistentCloudKitContainer(name: "PosesCKModel")
        let container = NSPersistentContainer(name: "PosesModel")
        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
            self.loaded?(storeDescription, error)
        }
        return container
    }()
}

// MARK: - Private

private extension DataServiceImpl {

    var fileUrl: URL {
        docsDirectory.appendingPathComponent("PosesModel.sqlite")
    }

    var docsDirectory: URL {
        let paths = FileManager.default.urls(for: .documentDirectory,
                                             in: .userDomainMask)
        return paths[0]
    }

    func seed() {
        let url = fileUrl
        guard !FileManager.default.fileExists(atPath: url.path),
              let seed = R.file.posesModelSqlite() else { return }

        do {
            try FileManager.default.copyItem(at: seed, to: url)
            log.info("seeded model: \(url)")
        } catch {
            log.error("seeding model: \(error)")
        }
    }

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
