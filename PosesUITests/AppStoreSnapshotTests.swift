// @copyright Trollwerks Inc.

import XCTest

final class AppStoreSnapshotTests: XCTestCase {

    // to reset all simulators:
    // xcrun simctl shutdown all
    // xcrun simctl erase all

    override func setUp() {
        super.setUp()
    }

    override func tearDown() {
        super.tearDown()
    }

    func testAppStoreSnapshots() {
        launch(arguments: [.disableAnimations,
                           .disableWaitIdle,
                           .takingScreenshots],
               settings: [.fullAccess(true),
                          .userName("Snapshots")])

        snapshot("01Launch")
    }
}
