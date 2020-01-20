// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// Provides stored data functionality
protocol DataService {

    /// viewContext
    var viewContext: NSManagedObjectContext { get }

    /// Write viewContext
    func save()

    /// Populate database
    func seed()
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
class DataServiceImpl: DataService, ServiceProvider {

    /// :nodoc:
    var viewContext: NSManagedObjectContext { persistentContainer.viewContext }

    /// :nodoc:
    func save() {
        _ = try? saveContext()
    }

    // MARK: - Core Data stack

    private let modelName = "PosesModel"

    /// Setup completion handler
    var loaded: ((NSPersistentStoreDescription, Error?) -> Void)?

    /// Core Data store 
    lazy var persistentContainer: NSPersistentContainer = {
        //let container = NSPersistentCloudKitContainer(name: "PosesCKModel")
        let container = NSPersistentContainer(name: modelName)

        seed()
        let psd = NSPersistentStoreDescription(url: storeURL)
        psd.type = NSSQLiteStoreType
        psd.shouldInferMappingModelAutomatically = true
        psd.shouldMigrateStoreAutomatically = true
        container.persistentStoreDescriptions.append(psd)

        container.loadPersistentStores { storeDescription, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }

            if let loaded = self.loaded {
                DispatchQueue.main.async {
                    loaded(storeDescription, error)
                }
            }
        }
        return container
    }()

    func seed() {
        let url = storeURL
        guard !FileManager.default.fileExists(atPath: url.path),
              let seed = R.file.posesModelSqlite() else {
            log.verbose("no seeding needed: \(url)")
            return
        }

        do {
            try FileManager.default.copyItem(at: seed, to: url)
            log.verbose("seeded model: \(url)")
        } catch {
            log.error("seeding model: \(error)")
        }

        // "remember to specify the rollback journaling mode..."
        // Technical Note TN2350 Working with Default Data in Core Data Apps
        // https://developer.apple.com/library/archive/technotes/tn2350/
        // Notes for migrating to CloudKit+SwiftUI friendly revision
        // swiftlint:disable line_length
        // https://github.com/riywo/PreloadedPersistentContainer
        // https://williamboles.me/progressive-core-data-migration/
        // https://www.raywenderlich.com/7585-lightweight-migrations-in-core-data-tutorial
        // https://developer.apple.com/library/archive/documentation/Cocoa/Conceptual/CoreDataVersioning/Articles/Introduction.html
    }
}

// MARK: - Private

private extension DataServiceImpl {

    var newBackgroundContext: NSManagedObjectContext {
        persistentContainer.newBackgroundContext()
    }

    func performForeground(task: @escaping (NSManagedObjectContext) -> Void) {
        viewContext.perform { task(self.viewContext) }
     }

     func performBackground(task: @escaping (NSManagedObjectContext) -> Void) {
         persistentContainer.performBackgroundTask(task)
     }

    var storeURL: URL {
        storeDirectory.appendingPathComponent("\(modelName).sqlite")
    }

    var storeDirectory: URL {
        // NSPersistentContainer.defaultDirectoryURL() // /Library/Application Support
        // PosesPro2 seeded to /Documents
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }

    func saveContext(backgroundContext: NSManagedObjectContext? = nil) throws {
        let context = backgroundContext ?? persistentContainer.viewContext
        if context.hasChanges {
            try context.save()
        }
    }
}

// MARK: - Testing

#if DEBUG

/// Stub for testing
final class DataServiceStub: DataServiceImpl {

    // for now, let UI tests run on production data store -
    // ought to always be freshly seeded on CI
}

#endif
