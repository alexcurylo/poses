// @copyright Trollwerks Inc.

/// ExtrasView exposed items
enum UIExtras: Exposable {

    /// Subscribe button
    case subscribe
    /// Upgrade buttons
    case upgrade(pack: String)
    /// Purchase buttons
    case purchase(pack: String)

    /// Feedback button
    case feedback
    /// Review button
    case review
    /// Restore button
    case restore
    /// Notes button
    case notes
    /// Visit button
    case visit
}
