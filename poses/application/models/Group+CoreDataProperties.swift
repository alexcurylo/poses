// @copyright Trollwerks Inc.
//

import Foundation
import CoreData


extension Group {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Group> {
        return NSFetchRequest<Group>(entityName: "Group")
    }

    @NSManaged public var name: String?
    @NSManaged public var order: NSNumber?
    @NSManaged public var rating: NSNumber?
    @NSManaged public var poses: NSSet?

}

// MARK: Generated accessors for poses
extension Group {

    @objc(addPosesObject:)
    @NSManaged public func addToPoses(_ value: Pose)

    @objc(removePosesObject:)
    @NSManaged public func removeFromPoses(_ value: Pose)

    @objc(addPoses:)
    @NSManaged public func addToPoses(_ values: NSSet)

    @objc(removePoses:)
    @NSManaged public func removeFromPoses(_ values: NSSet)

}
