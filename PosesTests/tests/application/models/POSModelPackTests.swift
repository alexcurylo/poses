// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class POSModelPackTests: TestCase {

    func testConstruction() throws {
        // given
        let service = DataServiceImpl()
        _ = POSModelPack(context: service.viewContext)

        // when
        let fetch: NSFetchRequest = POSModelPack.fetchRequest()

        // then
        XCTAssertNotNil(fetch)
    }

    func testSeed() throws {
        // given
        let sut = DataServiceImpl()

        // when
        let moc = sut.viewContext
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
