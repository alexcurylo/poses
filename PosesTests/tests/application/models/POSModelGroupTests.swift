// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class POSModelGroupTests: TestCase {

    func testConstruction() throws {
        // given
        let moc = CoreDataStack.shared.moc
        let sut = POSModelGroup(context: moc)
        defer { moc.delete(sut) }
        sut.name = "not Trash"

        // when
        let fetch: NSFetchRequest = POSModelGroup.fetchRequest()

        // then
        XCTAssertNotNil(fetch)
        XCTAssertFalse(sut.isTrash)
        XCTAssertEqual(sut.visible(in: moc), "0")
    }
}
