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
        launch(settings: [.subscribed(false)])

        Tab.categories.tap()

        Tab.favorites.tap()

        Tab.fitPose.tap()

        Tab.extras.tap()
        UIExtras.subscribe.tap()
        UIExtras.upgrade(pack: "female001free").tap()
        UIExtras.purchase(pack: "female001paid").tap()
        UIExtras.feedback.tap()
        UIExtras.review.tap()
        swipeUp()
        UIExtras.restore.tap()
        UIExtras.notes.tap()
        UIExtras.visit.tap()

        rebound()

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
