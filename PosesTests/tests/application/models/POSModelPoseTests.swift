// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class POSModelPoseTests: TestCase {

    func testConstruction() throws {
        // given
        let moc = CoreDataStack.shared.moc
        let sut = POSModelPose(context: moc).with {
            $0.number = 1105
            $0.embedded = true
        }
        defer { moc.delete(sut) }

        // when
        let fetch: NSFetchRequest = POSModelPose.fetchRequest()
        let result = sut.fetchVisiblePoseObjects(
            moc: NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType),
            sort: NSSortDescriptor())

        // then
        XCTAssertNotNil(fetch)
        XCTAssertNotNil(result)
        XCTAssertNotNil(sut.editingMOC)
        XCTAssertNotNil(sut.image)
        XCTAssertNil(sut.overlay)
    }
}
