// @copyright Trollwerks Inc.

import SwiftUI
import UIKit

/// SceneDelegate declared in Info.plist
final class SceneDelegate: UIResponder, UIWindowSceneDelegate, ServiceProvider {

    /// UIWindowSceneDelegate conformance
    var window: UIWindow?

    #if DEBUG
    /// Unit testing reference
    static var hostScene: UIScene?
    #endif

    /// :nodoc:
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard !UIApplication.isUnitTesting else {
            #if DEBUG
            Self.hostScene = scene
            #endif
            return
        }

        // Use to optionally configure and attach the UIWindow `window` to provided UIWindowScene `scene`.
        // If using a storyboard, the `window` property will automatically be initialized and attached to the scene.
        // This delegate does not imply the connecting scene or session are new
        // (see `application:configurationForConnectingSceneSession` instead).

        // Create the SwiftUI view that provides the window contents.
        // Get the managed object context from the shared persistent container.
        // set the context as the value for the managedObjectContext environment keyPath.
        // Add `@Environment(\.managedObjectContext)` in the views that will need the context.
        let contentView = ContentView().environment(\.managedObjectContext, data.viewContext)

        // Use a UIHostingController as window root view controller.
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: contentView)
            self.window = window
            window.makeKeyAndVisible()
        }
    }

    /// :nodoc:
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not neccessarily discarded
        // (see `application:didDiscardSceneSessions` instead).
    }

    /// :nodoc:
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    /// :nodoc:
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    /// :nodoc:
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    /// :nodoc:
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.

        data.save()
    }

    // UIWindowSceneDelegate
    //func windowScene(didUpdate previousCoordinateSpace...)
    // func windowScene(performActionFor shortcutItem...)
    // func windowScene(userDidAcceptCloudKitShareWith...)

    // UISceneDelegate
    // func scene(openURLContexts...>)
    // func stateRestorationActivity(for scene...)
    // func scene(willContinueUserActivityWithType...)
    // func scene(continue userActivity: NSUserActivity)
    // func scene(didFailToContinueUserActivityWithType...)
    // func scene(didUpdate userActivity: NSUserActivity)
}
