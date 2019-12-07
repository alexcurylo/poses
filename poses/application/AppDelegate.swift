// @copyright Trollwerks Inc.

import CoreData
import SwiftyBeaver
import UIKit

@UIApplicationMain
final class AppDelegate: UIResponder, UIApplicationDelegate {

    /// didFinishLaunchingWithOptions
    /// - Parameters:
    ///   - application: Application
    ///   - launchOptions: Launch options
    /// - Returns: Success
    func application(
        _ application: UIApplication,
        // swiftlint:disable:next discouraged_optional_collection
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        configureLogging()

        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(
        _ application: UIApplication,
        configurationForConnecting connectingSceneSession: UISceneSession,
        options: UIScene.ConnectionOptions
    ) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running,
        // this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
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

// MARK: - SwiftyBeaver
// https://docs.swiftybeaver.com

private extension AppDelegate {

    func configureLogging() {
        let swiftyBeaver = SwiftyBeaver.self
        let console = ConsoleDestination()
        swiftyBeaver.addDestination(console)

        let file = FileDestination()
        if UIApplication.isSimulator {
            // tail -f /tmp/swiftybeaver.log
            file.logFileURL = URL(fileURLWithPath: "/tmp/swiftybeaver.log")
        }
        swiftyBeaver.addDestination(file)

        if UIApplication.isProduction {
            let platform = SBPlatformDestination(
                appID: "E9QBr2",
                appSecret: "djbdgmnlni0Lvlw8tzn7iPtetjq9lpO3",
                encryptionKey: "hgJcqazafbGnlyoc3bwfxJeb6mavvu5L")
            swiftyBeaver.addDestination(platform)
        }
    }
}
