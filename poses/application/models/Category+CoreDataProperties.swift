// @copyright Trollwerks Inc.
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var key: String?
    @NSManaged public var rating: NSNumber?
    @NSManaged public var poses: NSSet?

}

// MARK: Generated accessors for poses
extension Category {

    @objc(addPosesObject:)
    @NSManaged public func addToPoses(_ value: Pose)

    @objc(removePosesObject:)
    @NSManaged public func removeFromPoses(_ value: Pose)

    @objc(addPoses:)
    @NSManaged public func addToPoses(_ values: NSSet)

    @objc(removePoses:)
    @NSManaged public func removeFromPoses(_ values: NSSet)

}
