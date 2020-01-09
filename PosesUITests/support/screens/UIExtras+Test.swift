// @copyright Trollwerks Inc.

import XCTest

extension UIExtras: Elemental {

    var type: XCUIElement.ElementType {
        switch self {
        case .subscribe,
             .upgrade,
             .purchase,
             .feedback,
             .review,
             .restore,
             .notes,
             .visitGithub,
             .visitPhotographyTips:
            return .button
        }
    }
}
