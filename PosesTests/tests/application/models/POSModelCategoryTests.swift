// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class POSModelCategoryTests: TestCase {

    func testConstruction() throws {
        // given
        let service = DataServiceImpl()
        let sut = POSModelCategory(context: service.viewContext)
        sut.key = "test"

        // when
        let fetch: NSFetchRequest = POSModelCategory.fetchRequest()

        // then
        XCTAssertNotNil(fetch)
        XCTAssertEqual(sut.title, "test")
        XCTAssertEqual(sut.visible, "TODO")
    }
}
