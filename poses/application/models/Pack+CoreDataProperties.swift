// @copyright Trollwerks Inc.
//

import Foundation
import CoreData


extension Pack {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pack> {
        return NSFetchRequest<Pack>(entityName: "Pack")
    }

    @NSManaged public var embedded: NSNumber?
    @NSManaged public var key: String?
    @NSManaged public var purchased: NSNumber?
    @NSManaged public var rating: NSNumber?
    @NSManaged public var poses: NSSet?

}

// MARK: Generated accessors for poses
extension Pack {

    @objc(addPosesObject:)
    @NSManaged public func addToPoses(_ value: Pose)

    @objc(removePosesObject:)
    @NSManaged public func removeFromPoses(_ value: Pose)

    @objc(addPoses:)
    @NSManaged public func addToPoses(_ values: NSSet)

    @objc(removePoses:)
    @NSManaged public func removeFromPoses(_ values: NSSet)

}
