// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// Provides stored data functionality
protocol DataService {
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
}

// MARK: - Testing

#if DEBUG

/// Stub for testing
final class DataServiceStub: DataServiceImpl {

    // for now, let UI tests run on production data store -
    // ought to always be freshly seeded on CI
}

#endif
