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
        let app = XCUIApplication()
        app.launch()

        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
