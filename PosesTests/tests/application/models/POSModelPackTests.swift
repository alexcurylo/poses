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
}
