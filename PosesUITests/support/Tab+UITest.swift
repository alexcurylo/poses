// @copyright Trollwerks Inc.

import XCTest

extension Tab {

    func tap() {
        let bar = XCUIApplication().tabBars.firstMatch.buttons
        bar.element(boundBy: tag).firstMatch.tap()
    }
}
