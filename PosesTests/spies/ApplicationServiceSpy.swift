// @copyright Trollwerks Inc.

@testable import Poses

// generated by https://github.com/seanhenry/SwiftMockGeneratorForXcode
// swiftlint:disable all

final class ApplicationServiceSpy: ApplicationService {
    var invokedVersionGetter = false
    var invokedVersionGetterCount = 0
    var stubbedVersion: String! = ""
    var version: String {
        invokedVersionGetter = true
        invokedVersionGetterCount += 1
        return stubbedVersion
    }
    var invokedLaunch = false
    var invokedLaunchCount = 0
    var invokedLaunchParameters: (url: URL, Void)?
    var invokedLaunchParametersList = [(url: URL, Void)]()
    func launch(url: URL) {
        invokedLaunch = true
        invokedLaunchCount += 1
        invokedLaunchParameters = (url, ())
        invokedLaunchParametersList.append((url, ()))
    }
    var invokedRoute = false
    var invokedRouteCount = 0
    var invokedRouteParameters: (route: Route, Void)?
    var invokedRouteParametersList = [(route: Route, Void)]()
    func route(to route: Route) {
        invokedRoute = true
        invokedRouteCount += 1
        invokedRouteParameters = (route, ())
        invokedRouteParametersList.append((route, ()))
    }
    var invokedEndEditing = false
    var invokedEndEditingCount = 0
    func endEditing() {
        invokedEndEditing = true
        invokedEndEditingCount += 1
    }
}
