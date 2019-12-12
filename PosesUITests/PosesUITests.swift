// @copyright Trollwerks Inc.

import XCTest

final class PosesUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func testExample() {
        launch(settings: [.fullAccess(false)])

        let app = XCUIApplication()
        let tabBarsQuery = app.tabBars
        let secondButton = tabBarsQuery.buttons["Second"]
        secondButton.tap()
        let firstButton = tabBarsQuery.buttons["First"]
        firstButton.tap()

        let element = app
                      .children(matching: .window)
                      .element(boundBy: 0)
                      .children(matching: .other)
                      .element.children(matching: .other)
                      .element.children(matching: .other)
                      .element.children(matching: .other)
                      .element.children(matching: .other)
                      .element.children(matching: .other)
                      .element.children(matching: .other)
                      .element
        element.swipeLeft()
        element.swipeRight()

        secondButton.tap()
        firstButton.tap()
    }

    #if TEST_LAUNCH_PERFORMANCE
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
    #endif
}
