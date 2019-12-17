// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class PackTests: TestCase {

    func testConstruction() throws {
        // given
        let service = DataServiceImpl()
        _ = Pack(context: service.viewContext)

        // when
        let fetch: NSFetchRequest = Pack.fetchRequest()

        // then
        XCTAssertNotNil(fetch)
    }
}
