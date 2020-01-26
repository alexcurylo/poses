// @copyright Trollwerks Inc.

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
        [
            L.tabGallery(),
            L.tabCategories(),
            L.tabFavorites(),
            L.tabFitPose(),
            L.tabExtras(),
        ][rawValue]
    }
}
