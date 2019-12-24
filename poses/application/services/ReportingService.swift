// @copyright Trollwerks Inc.

/// Analytics and crash reporting
protocol ReportingService: AnyObject {

    /// Report an event
    /// - Parameter event: Event to report
    func event(_ event: AnalyticsEvent)
    /// Start timing an event
    /// - Parameter event: Event to report
    func start(_ event: AnalyticsEvent)
    /// Finish timing an event
    /// - Parameter event: Event to report
    func finish(_ event: AnalyticsEvent)
    /// Report screen appearance
    /// - Parameter name: Name of screen
    func screen(_ name: String)
    /// Leave breadcrumb
    /// - Parameter breadcrumb: breadcrumb
    func breadcrumb(_ breadcrumb: String)
    /// Report error
    /// - Parameters:
    ///   - error: Error
    ///   - id: String
    ///   - message: String
    ///   - params: Parameters
    func error(_ error: Error,
               id: String,
               message: String,
               params: [AnyHashable: Any])
}

/// Reportable events
enum AnalyticsEvent {

    /// Post Review
    case postReview
    /// Restore Purchases
    case restorePurchases
    /// Screen appearance
    case screen(name: String)
    /// Send Feedback
    case sendFeedback
    /// Show Release Notes
    case showReleaseNotes
    /// Visit PhotographyTips
    case visitPhotographyTips

    fileprivate var parameters: [Parameter: Any] {
        switch self {
        case .screen(let name):
            return [ .name: name ]
        case .postReview,
             .restorePurchases,
             .sendFeedback,
             .showReleaseNotes,
             .visitPhotographyTips:
            return [:]
        }
    }

    fileprivate enum Parameter: String {
        case name
    }
}

/// Production implementation of ReportingService
class FlurryReportingService: ReportingService {

    private let eventMapper = AnalyticsEventMapper()

    /// :nodoc:
    func event(_ event: AnalyticsEvent) {
        let name = eventMapper.eventName(for: event)
        let parameters = eventMapper.parameters(for: event)
        Flurry.logEvent(name,
                        withParameters: parameters)
    }

    /// :nodoc:
    func start(_ event: AnalyticsEvent) {
        let name = eventMapper.eventName(for: event)
        let parameters = eventMapper.parameters(for: event)
            Flurry.logEvent(name,
                            withParameters: parameters,
                            timed: true)
    }

    /// :nodoc:
    func finish(_ event: AnalyticsEvent) {
        let name = eventMapper.eventName(for: event)
        let parameters = eventMapper.parameters(for: event)
        Flurry.endTimedEvent(name,
                             withParameters: parameters)
    }

    /// :nodoc:
    func screen(_ name: String) {
        event(.screen(name: name))
    }

    /// :nodoc:
    func breadcrumb(_ breadcrumb: String) {
        Flurry.leaveBreadcrumb(breadcrumb)
    }

    /// :nodoc:
    func error(_ error: Error,
               id: String,
               message: String,
               params: [AnyHashable: Any]) {
        Flurry.logError(id,
                        message: message,
                        error: error,
                        withParameters: params)
    }
}

private struct AnalyticsEventMapper {

    func eventName(for event: AnalyticsEvent) -> String {
        switch event {
        case .postReview:
            return "PostReview"
        case .restorePurchases:
            return "RestorePurchases"
        case .sendFeedback:
            return "SendFeedback"
        case .showReleaseNotes:
            return "ShowReleaseNotes"
        case .screen:
            return "Screen"
        case .visitPhotographyTips:
            return "VisitPhotographyTips"
        }
    }

    func parameters(for event: AnalyticsEvent) -> [String: Any] {
        return event.parameters.mapKeys { parameterName(for: $0) }
    }

    func parameterName(for parameter: AnalyticsEvent.Parameter) -> String {
        switch parameter {
        case .name:
            return parameter.rawValue
        }
    }
}

private extension Dictionary {

    func mapKeys<NewKeyT>(_ transform: (Key) throws -> NewKeyT) rethrows -> [NewKeyT: Value] {
        var newDictionary = [NewKeyT: Value]()
        try forEach { key, value in
            let newKey = try transform(key)
            newDictionary[newKey] = value
        }
        return newDictionary
    }
}

// MARK: - Testing

#if DEBUG

/// Stub for testing
final class ReportingServiceStub: FlurryReportingService {
}

#endif
