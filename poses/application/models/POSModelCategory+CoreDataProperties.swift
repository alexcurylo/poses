// @copyright Trollwerks Inc.
//

import Foundation
import CoreData


extension POSModelCategory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<POSModelCategory> {
        return NSFetchRequest<POSModelCategory>(entityName: "Category")
    }

    @NSManaged public var key: String?
    @NSManaged public var rating: Int32
    @NSManaged public var poses: NSSet?

}

// MARK: Generated accessors for poses
extension POSModelCategory {

    @objc(addPosesObject:)
    @NSManaged public func addToPoses(_ value: POSModelPose)

    @objc(removePosesObject:)
    @NSManaged public func removeFromPoses(_ value: POSModelPose)

    @objc(addPoses:)
    @NSManaged public func addToPoses(_ values: NSSet)

    @objc(removePoses:)
    @NSManaged public func removeFromPoses(_ values: NSSet)

}
