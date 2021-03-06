// @copyright Trollwerks Inc.
//

import Foundation
import CoreData


extension POSModelPack {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<POSModelPack> {
        return NSFetchRequest<POSModelPack>(entityName: "Pack")
    }

    @NSManaged public var embedded: Bool
    @NSManaged public var key: String?
    @NSManaged public var purchased: Bool
    @NSManaged public var rating: Int32
    @NSManaged public var poses: NSOrderedSet?

}

// MARK: Generated accessors for poses
extension POSModelPack {

    @objc(insertObject:inPosesAtIndex:)
    @NSManaged public func insertIntoPoses(_ value: POSModelPose, at idx: Int)

    @objc(removeObjectFromPosesAtIndex:)
    @NSManaged public func removeFromPoses(at idx: Int)

    @objc(insertPoses:atIndexes:)
    @NSManaged public func insertIntoPoses(_ values: [POSModelPose], at indexes: NSIndexSet)

    @objc(removePosesAtIndexes:)
    @NSManaged public func removeFromPoses(at indexes: NSIndexSet)

    @objc(replaceObjectInPosesAtIndex:withObject:)
    @NSManaged public func replacePoses(at idx: Int, with value: POSModelPose)

    @objc(replacePosesAtIndexes:withPoses:)
    @NSManaged public func replacePoses(at indexes: NSIndexSet, with values: [POSModelPose])

    @objc(addPosesObject:)
    @NSManaged public func addToPoses(_ value: POSModelPose)

    @objc(removePosesObject:)
    @NSManaged public func removeFromPoses(_ value: POSModelPose)

    @objc(addPoses:)
    @NSManaged public func addToPoses(_ values: NSOrderedSet)

    @objc(removePoses:)
    @NSManaged public func removeFromPoses(_ values: NSOrderedSet)

}
