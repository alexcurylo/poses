// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class POSModelPackTests: TestCase {

    func testConstruction() throws {
        // given
        let moc = CoreDataStack.shared.moc
        let sut = POSModelPack(context: moc)
        defer { moc.delete(sut) }
        sut.key = "test"

        // when
        let fetch: NSFetchRequest = POSModelPack.fetchRequest()

        // then
        XCTAssertNotNil(fetch)
    }

    func testSeed() throws {
        // given
        let moc = CoreDataStack.shared.moc

        // when
        let packs = try moc.fetch(POSModelPack.request)

        // then
        XCTAssertEqual(packs.count, PackKey.packs)
        try packs.forEach {
            let raw = try XCTUnwrap($0.key)
            let key = try XCTUnwrap(PackKey(rawValue: raw))
            XCTAssertEqual($0.poses?.count ?? 0, key.count)
        }
    }
}
