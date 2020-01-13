// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class POSModelPoseTests: TestCase {

    func testConstruction() throws {
        // given
        let service = DataServiceImpl()
        let sut = POSModelPose(context: service.viewContext)

        // when
        let fetch: NSFetchRequest = POSModelPose.fetchRequest()
        let result = sut.fetchVisiblePoseObjects(
            moc: NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType),
            sort: NSSortDescriptor())

        // then
        XCTAssertNotNil(fetch)
        XCTAssertNotNil(result)
        XCTAssertEqual(POSModelPose.poseCacheFolder, "TODO")
        XCTAssertEqual(sut.filename, "TODO")
        XCTAssertNotNil(sut.editingMOC)
        XCTAssertNotNil(sut.image)
        XCTAssertNotNil(sut.overlay)
    }
}
