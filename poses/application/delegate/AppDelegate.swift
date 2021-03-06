// @copyright Trollwerks Inc.

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
        super.handlers + runtimeHandlers
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
                ServiceHandler(),
                LaunchHandler(),
            ]
        case .uiTesting:
            #if DEBUG
            return [
                ServiceHandlerStub(),
                LaunchHandler(),
            ]
            #else
            return []
            #endif
        case .unitTesting:
            // Spies set up in TestCase.setUp()
            return []
        }
    }
}
