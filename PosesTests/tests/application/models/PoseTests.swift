// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class PoseTests: TestCase {

    func testConstruction() throws {
        // given
        let service = DataServiceImpl()
        let sut = Pose(context: service.viewContext)

        // when
        let fetch: NSFetchRequest = Pose.fetchRequest()
        let result = sut.fetchVisiblePoseObjects(
            moc: NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType),
            sort: NSSortDescriptor())

        // then
        XCTAssertNotNil(fetch)
        XCTAssertNotNil(result)
        XCTAssertEqual(Pose.poseCacheFolder, "TODO")
        XCTAssertEqual(sut.filename, "TODO")
        XCTAssertNotNil(sut.editingMOC)
        XCTAssertNotNil(sut.image)
        XCTAssertNotNil(sut.overlay)
    }
}
