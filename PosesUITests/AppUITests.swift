// @copyright Trollwerks Inc.

import XCTest

final class AppUITests: XCTestCase {

    override func setUp() {
        super.setUp()
        continueAfterFailure = false
    }

    override func tearDown() {
        super.tearDown()
    }

    func testTabNavigation() {
        launch(settings: [.fullAccess(false)])
        //printHierarchy()

        Tab.categories.tap()
        Tab.favorites.tap()
        Tab.fitPose.tap()
        Tab.extras.tap()
        Tab.gallery.tap()
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
