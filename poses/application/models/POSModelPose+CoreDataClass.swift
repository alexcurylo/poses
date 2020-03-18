// @copyright Trollwerks Inc.

import CoreData

/// PosesModel entity
@objc(POSModelPose) public final class POSModelPose: NSManagedObject {

    /// Editing  MOC
    var editingMOC: NSManagedObjectContext {
        NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    }

    /// Display image -- loaded as opaque JPEG
    var image: UIImage? {
        do {
            let data = try Data(contentsOf: try unwrap(path))
            return UIImage(data: data)
        } catch {
            return nil
        }
    }

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

private extension POSModelPose {

    static let jpngFolder = "jpng"

    static let jpngCacheFolder: URL? = {
        try? FileManager.default.url(
            for: .cachesDirectory,
            in: .userDomainMask,
            appropriateFor: nil,
            create: true
        )
        .appendingPathComponent(
            jpngFolder,
            isDirectory: true
        )
    }()

    static let jpngEmbedFolder: URL? = {
        Bundle.main.resourceURL?.appendingPathComponent(jpngFolder,
                                                        isDirectory: true)
    }()

    var folder: URL? {
        switch (cached, embedded) {
        case (true, _): return Self.jpngCacheFolder
        case (_, true): return Self.jpngEmbedFolder
        case (false, false): return nil
        }
    }

    var filename: String {
        String(format: "%04d", number)
    }

    var path: URL? {
        folder?.appendingPathComponent(filename, isDirectory: false)
               .appendingPathExtension("jpng")
    }
}

extension POSModelPose: EntityNamable {

    /// name of entity in store
    static var entityName = "Pose"
}

extension POSModelPose: Identifiable {

    public var id: Int32 { number }
}
