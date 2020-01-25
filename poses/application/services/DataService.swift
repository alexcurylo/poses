// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// Provides stored data functionality
protocol DataService {

    /// Save all pending Core Data changes
    func save(moc: NSManagedObjectContext?)
}

extension DataService {

    /// Save all pending Core Data changes
    func save(moc: NSManagedObjectContext? = nil) {
        save(moc: moc)
    }

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

    private var stack: CoreDataStack { CoreDataStack.shared }

    /// :nodoc:
    func save(moc: NSManagedObjectContext?) {
        stack.save(moc: moc)
    }
}

// MARK: - Testing

#if DEBUG

/// Stub for testing
final class DataServiceStub: DataServiceImpl {

    // for now, let UI tests run on production data store -
    // ought to always be freshly seeded on CI

    /// :nodoc:
    override func save(moc: NSManagedObjectContext?) { }
}

#endif
