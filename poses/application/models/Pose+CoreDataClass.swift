// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
public final class Pose: NSManagedObject {

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
    ) -> Result<[Pose], Error> {
        .failure("TODO")
    }
}
