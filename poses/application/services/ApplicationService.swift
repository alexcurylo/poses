// @copyright Trollwerks Inc.

import UIKit

/// Application navigation, external, and global state functions
protocol ApplicationService {

    /// Launches URL externally
    /// - Parameter url: URL to launch
    func launch(url: URL)

    /// Route to an enumerated destination
    /// - Parameter route: Route case
    func route(to route: Route)

    /// End any editing in application
    func endEditing()

    /// Application version(build) string
    var version: String { get }
}

/// Enumerated routing destinations
enum Route {

    /// tab
    case tab(Tab)

    /// Tab to select for a route
    var tabIndex: Int {
        switch self {
        case .tab(let tab): return tab.rawValue
        }
    }
}

extension UIApplication: ApplicationService {

    /// Launches URL externally
    /// - Parameter url: URL to launch
    func launch(url: URL) {
        open(url, options: [:], completionHandler: nil)
    }

    /// Route to an enumerated destination
    /// - Parameter route: Route case
    func route(to route: Route) {
        _ = route.tabIndex
        // inject to SwiftUI
    }

    /// End any editing in application
    func endEditing() {
        UIApplication.shared.sendAction(
            #selector(UIApplication.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil)
    }

    /// Application version(build) string
    var version: String {
        var version = ""
        if let app = StringKey.appVersion.string,
           let build = StringKey.appBuild.string {
            version = L.appVersion(app, build)
        }
        return version
    }
}
