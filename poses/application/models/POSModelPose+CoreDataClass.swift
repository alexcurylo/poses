// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
@objc(POSModelPose) public final class POSModelPose: NSManagedObject {

    /// Cache folder
    static var poseCacheFolder: String { "TODO" }

    /// Display count
    var filename: String { "TODO" }

    /// Editing  MOC
    var editingMOC: NSManagedObjectContext {
        NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }

    /// Display image
    var image: UIImage { UIImage() }

    /// Display overlay
    var overlay: UIImage { UIImage() }

    /// Fetch poses
    func fetchVisiblePoseObjects(
        moc: NSManagedObjectContext,
        sort: NSSortDescriptor
    ) -> Result<[POSModelPose], Error> {
        .failure("TODO")
    }
}

extension POSModelPose: EntityModel {

    /// EntityModel conformance
    typealias Entity = POSModelPose

    /// name of entity in store
    static var entityName = "Pose"
}
