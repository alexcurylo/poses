// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class POSModelGroupTests: TestCase {

    func testConstruction() throws {
        // given
        let service = DataServiceImpl()
        let sut = POSModelGroup(context: service.viewContext)
        sut.name = "not Trash"

        // when
        let fetch: NSFetchRequest = POSModelGroup.fetchRequest()

        // then
        XCTAssertNotNil(fetch)
        XCTAssertFalse(sut.isTrash)
        XCTAssertEqual(sut.visible(in: service.viewContext), "0")
    }
}
