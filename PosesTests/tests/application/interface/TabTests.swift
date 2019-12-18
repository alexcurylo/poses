// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class TabTests: TestCase {

    func testConstruction() {
        XCTAssertNil(Tab("Fake"))
        for tab in Tab.allCases {
            let sut = Tab(tab.description)
            XCTAssertEqual(sut, tab)
        }
    }

    func testLabels() throws {
        XCTAssertEqual(L.tabGallery(), String(Tab.gallery))
        XCTAssertEqual(L.tabCategories(), String(Tab.categories))
        XCTAssertEqual(L.tabFavorites(), String(Tab.favorites))
        XCTAssertEqual(L.tabFitPose(), String(Tab.fitPose))
        XCTAssertEqual(L.tabExtras(), String(Tab.extras))
    }
}
