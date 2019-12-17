// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class GroupTests: TestCase {

    func testConstruction() throws {
        // given
        let service = DataServiceImpl()
        let sut = Group(context: service.viewContext)
        sut.name = "not Trash"

        // when
        let fetch: NSFetchRequest = Group.fetchRequest()

        // then
        XCTAssertNotNil(fetch)
        XCTAssertFalse(sut.isTrash)
        XCTAssertEqual(sut.visible, "TODO")
    }
}
