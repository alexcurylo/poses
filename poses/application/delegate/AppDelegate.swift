// @copyright Trollwerks Inc.

import CoreData
import UIKit

/// Our routing application delegate
@UIApplicationMain final class AppDelegate: RoutingAppDelegate {

    /// Runtime environments our app delegate recognizes
    enum Runtime {
        /// Active user input
        case production
        /// Executing UI tests
        case uiTesting
        /// Executing unit tests
        case unitTesting
    }

    /// Handlers for the active environment
    override var handlers: Handlers {
        return super.handlers + runtimeHandlers
    }

    private var runtimeHandlers: Handlers = {
        var runtime: Runtime = .production
        #if DEBUG
        if UIApplication.isUITesting {
            runtime = .uiTesting
        } else if UIApplication.isUnitTesting {
            runtime = .unitTesting
        }
        #endif
        return AppDelegate.runtimeHandlers(for: runtime)
    }()

    /// Handlers for environment
    /// - Parameter runtime: Environment descriptor
    /// - Returns: Appropriate handler collection
    static func runtimeHandlers(for runtime: Runtime) -> Handlers {
        switch runtime {
        case .production:
            return [
                //ServiceHandler(),
                LaunchHandler()
            ]
        #if DEBUG
        case .uiTesting:
            return [
                //ServiceHandlerStub(),
                LaunchHandler()
            ]
        #endif
        default:
            return []
        }
    }

// MARK: - Core Data stack

    lazy var persistentContainer: NSPersistentCloudKitContainer = {
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

    // MARK: - Core Data Saving support

    func saveContext () {
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
