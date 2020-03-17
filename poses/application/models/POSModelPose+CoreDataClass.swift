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

    /// Display image -- loaded as opaque JPEG
    var image: UIImage? { nil }

    /// Fit Pose overlay -- loaded with transparency
    var overlay: UIImage? { nil }

    /// Fetch poses
    func fetchVisiblePoseObjects(
        moc: NSManagedObjectContext,
        sort: NSSortDescriptor
    ) -> Result<[POSModelPose], Error> {
        .failure("TODO")
    }
}

extension POSModelPose: EntityNamable {

    /// name of entity in store
    static var entityName = "Pose"
}

extension POSModelPose: Identifiable {

    public var id: Int32 { number }
}
