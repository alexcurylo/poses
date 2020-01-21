// @copyright Trollwerks Inc.

/// Tabs on the home screen
enum Tab: Int, CaseIterable {

    /// Gallery
    case gallery = 0
    /// Categories
    case categories
    /// Favorites
    case favorites
    /// Fit Pose
    case fitPose
    /// Extras
    case extras

    /// SwiftUI view tag
    var tag: Int { rawValue }

    #if !UITEST
    var title: String {
        switch self {
        case .favorites:
            return L.screenFavorites()
        default:
            return String(self)
        }
    }
    #endif
}
