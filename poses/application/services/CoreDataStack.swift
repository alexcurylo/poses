// @copyright Trollwerks Inc.

import CoreData

/// Core Data wrapper
final class CoreDataStack {

    /// Exposed as singleton for SwiftUI \.managedObjectContext
    static var shared = CoreDataStack()

    /// Setup completion handler
     var loaded: ((NSPersistentStoreDescription, Error?) -> Void)?

    /// Main thread managed object contecxt
    var moc: NSManagedObjectContext {
        persistentContainer.viewContext
    }

    /// Access to model for tests
    var mom: NSManagedObjectModel {
        persistentContainer.managedObjectModel
    }

    private let modelName = "PosesModel"

    private lazy var persistentContainer: NSPersistentContainer = {
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
                // appears to crash here loading for SwiftUI previews?
                print("loadPersistentStores error \(error), \(error.userInfo)")
            }

            self.validate(moc: container.viewContext)
            if let loaded = self.loaded {
                DispatchQueue.main.async {
                    loaded(storeDescription, error)
                }
            }
        }
        return container
    }()

    /// Save all pending Core Data changes
    func save(moc: NSManagedObjectContext? = nil) {
        do {
            let moc = moc ?? persistentContainer.viewContext
            if moc.hasChanges {
                try moc.save()
            }
        } catch {
            let nserror = error as NSError
            fatalError("saveContext error \(nserror), \(nserror.userInfo)")
        }
    }
}

// MARK: - Private

private extension CoreDataStack {

    var viewContext: NSManagedObjectContext {
        persistentContainer.viewContext
    }

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

    func seed() {
        let url = storeURL
        guard !FileManager.default.fileExists(atPath: url.path),
              let seed = R.file.posesModelSqlite() else {
            //log.verbose("no seeding needed: \(url)")
            return
        }

        do {
            try FileManager.default.copyItem(at: seed, to: url)
            //log.verbose("seeded model: \(url)")
        } catch {
            //log.error("seeding model: \(error)")
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

    func validate(moc: NSManagedObjectContext) {
        guard let groups = try? moc.count(for: POSModelGroup.request),
              groups == 0 else { return }

        let faves = POSModelGroup(context: moc)
        faves.name = L.groupFavorites()
        faves.order = 1

        let trash = POSModelGroup(context: moc)
        trash.name = L.groupTrash()
        trash.order = Int32.max

        do {
            try moc.save()
        } catch {
            let nserror = error as NSError
            fatalError("validate error \(nserror), \(nserror.userInfo)")
        }
    }
}
