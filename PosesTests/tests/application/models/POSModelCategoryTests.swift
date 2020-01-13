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

    func testSeed() throws {
        // given
        let sut = DataServiceImpl()

        // when
        let moc = sut.viewContext
        let categoryRequest = NSFetchRequest<POSModelCategory>(entityName: "Category")
        let categories = try moc.fetch(categoryRequest)

        // then
        XCTAssertEqual(categories.count, 24)
        try categories.forEach {
            let raw = try XCTUnwrap($0.key)
            let key = try XCTUnwrap(CategoryKey(rawValue: raw))
            XCTAssertEqual($0.poses?.count ?? 0, seed[key])
        }
    }
}

private let seed: [CategoryKey: Int] = [
    .athletic: 56,
    .closeup: 37,
    .crawl: 55,
    .crouch: 27,
    .dance: 49,
    .kneelObject: 13,
    .kneelBench: 25,
    .kneelBoth: 166,
    .kneelOne: 30,
    .reclineAir: 72,
    .reclineBench: 20,
    .reclineBack: 103,
    .reclineFront: 70,
    .reclineSide: 65,
    .seatedBench: 106,
    .seatedChair: 79,
    .seatedFloor: 170,
    .seatedLegs: 115,
    .seatedStool: 123,
    .standBack: 46,
    .standFront: 112,
    .standOjbect: 12,
    .standSide: 167,
    .standProps: 257
]
