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
}

extension Tab: LosslessStringConvertible {

    init?(_ description: String) {
        if let tab = Tab.allCases.first(where: { $0.description == description }) {
            self = tab
        } else {
            return nil
        }
    }
}

extension Tab: CustomStringConvertible {

    var description: String {
        [ L.tabGallery(),
          L.tabCategories(),
          L.tabFavorites(),
          L.tabFitPose(),
          L.tabExtras() ][rawValue]
    }
}
