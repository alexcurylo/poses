// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class CategoryTests: TestCase {

    func testConstruction() throws {
        // given
        let service = DataServiceImpl()
        let sut = Category(context: service.viewContext)
        sut.key = "test"

        // when
        let fetch: NSFetchRequest = Category.fetchRequest()

        // then
        XCTAssertNotNil(fetch)
        XCTAssertEqual(sut.title, "test")
        XCTAssertEqual(sut.visible, "TODO")
    }
}
