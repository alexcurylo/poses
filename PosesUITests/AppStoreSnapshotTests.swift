// @copyright Trollwerks Inc.

import XCTest

final class AppStoreSnapshotTests: XCTestCase {

    // to reset all simulators:
    // xcrun simctl shutdown all
    // xcrun simctl erase all

    override func setUp() {
        super.setUp()
        continueAfterFailure = true
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAppStoreSnapshots() {
        launch(arguments: [.disableAnimations,
                           .disableWaitIdle,
                           .takingScreenshots],
               settings: [.subscribed(true),
                          .userName("Snapshots")])

        snapshot("01Gallery")
        Tab.categories.tap()
        snapshot("02Categories")
        Tab.favorites.tap()
        snapshot("03Favorites")
        Tab.fitPose.tap()
        snapshot("04FitPose")
        Tab.extras.tap()
        snapshot("05Extras")
    }
}
