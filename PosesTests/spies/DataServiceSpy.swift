// @copyright Trollwerks Inc.

import CoreData
@testable import Poses_Pro

// generated by https://github.com/seanhenry/SwiftMockGeneratorForXcode
// swiftlint:disable all

final class DataServiceSpy: DataService {
    var invokedViewContextGetter = false
    var invokedViewContextGetterCount = 0
    var stubbedViewContext: NSManagedObjectContext!
    var viewContext: NSManagedObjectContext {
        invokedViewContextGetter = true
        invokedViewContextGetterCount += 1
        return stubbedViewContext
    }
    var invokedSave = false
    var invokedSaveCount = 0
    func save() {
        invokedSave = true
        invokedSaveCount += 1
    }
}
