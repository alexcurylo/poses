// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class POSModelCategoryTests: TestCase {

    func testConstruction() throws {
        // given
        let moc = CoreDataStack.shared.moc
        let sut = POSModelCategory(context: moc)
        defer { moc.delete(sut) }
        sut.key = "test"

        // when
        let fetch: NSFetchRequest = POSModelCategory.fetchRequest()

        // then
        XCTAssertNotNil(fetch)
        XCTAssertEqual(sut.title, "test")
        XCTAssertEqual(sut.visible(in: moc), "0")
    }

    func testSeed() throws {
        // given
        let moc = CoreDataStack.shared.moc

        // when
        let categories = try moc.fetch(POSModelCategory.request)

        // then
        XCTAssertEqual(categories.count, CategoryKey.categories)
        try categories.forEach {
            let raw = try XCTUnwrap($0.key)
            let key = try XCTUnwrap(CategoryKey(rawValue: raw))
            XCTAssertEqual($0.poses?.count ?? 0, key.count)
        }
    }
}
