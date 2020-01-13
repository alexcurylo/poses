// @copyright Trollwerks Inc.
//

import Foundation
import CoreData


extension POSModelPose {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<POSModelPose> {
        return NSFetchRequest<POSModelPose>(entityName: "Pose")
    }

    @NSManaged public var cached: Bool
    @NSManaged public var embedded: Bool
    @NSManaged public var number: Int32
    @NSManaged public var rating: Int32
    @NSManaged public var thumbnailed: Bool
    @NSManaged public var trashed: Bool
    @NSManaged public var visible: Bool
    @NSManaged public var categories: NSOrderedSet?
    @NSManaged public var groups: NSOrderedSet?
    @NSManaged public var packs: NSOrderedSet?

}

// MARK: Generated accessors for categories
extension POSModelPose {

    @objc(insertObject:inCategoriesAtIndex:)
    @NSManaged public func insertIntoCategories(_ value: POSModelCategory, at idx: Int)

    @objc(removeObjectFromCategoriesAtIndex:)
    @NSManaged public func removeFromCategories(at idx: Int)

    @objc(insertCategories:atIndexes:)
    @NSManaged public func insertIntoCategories(_ values: [POSModelCategory], at indexes: NSIndexSet)

    @objc(removeCategoriesAtIndexes:)
    @NSManaged public func removeFromCategories(at indexes: NSIndexSet)

    @objc(replaceObjectInCategoriesAtIndex:withObject:)
    @NSManaged public func replaceCategories(at idx: Int, with value: POSModelCategory)

    @objc(replaceCategoriesAtIndexes:withCategories:)
    @NSManaged public func replaceCategories(at indexes: NSIndexSet, with values: [POSModelCategory])

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: POSModelCategory)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: POSModelCategory)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSOrderedSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSOrderedSet)

}

// MARK: Generated accessors for groups
extension POSModelPose {

    @objc(insertObject:inGroupsAtIndex:)
    @NSManaged public func insertIntoGroups(_ value: POSModelGroup, at idx: Int)

    @objc(removeObjectFromGroupsAtIndex:)
    @NSManaged public func removeFromGroups(at idx: Int)

    @objc(insertGroups:atIndexes:)
    @NSManaged public func insertIntoGroups(_ values: [POSModelGroup], at indexes: NSIndexSet)

    @objc(removeGroupsAtIndexes:)
    @NSManaged public func removeFromGroups(at indexes: NSIndexSet)

    @objc(replaceObjectInGroupsAtIndex:withObject:)
    @NSManaged public func replaceGroups(at idx: Int, with value: POSModelGroup)

    @objc(replaceGroupsAtIndexes:withGroups:)
    @NSManaged public func replaceGroups(at indexes: NSIndexSet, with values: [POSModelGroup])

    @objc(addGroupsObject:)
    @NSManaged public func addToGroups(_ value: POSModelGroup)

    @objc(removeGroupsObject:)
    @NSManaged public func removeFromGroups(_ value: POSModelGroup)

    @objc(addGroups:)
    @NSManaged public func addToGroups(_ values: NSOrderedSet)

    @objc(removeGroups:)
    @NSManaged public func removeFromGroups(_ values: NSOrderedSet)

}

// MARK: Generated accessors for packs
extension POSModelPose {

    @objc(insertObject:inPacksAtIndex:)
    @NSManaged public func insertIntoPacks(_ value: POSModelPack, at idx: Int)

    @objc(removeObjectFromPacksAtIndex:)
    @NSManaged public func removeFromPacks(at idx: Int)

    @objc(insertPacks:atIndexes:)
    @NSManaged public func insertIntoPacks(_ values: [POSModelPack], at indexes: NSIndexSet)

    @objc(removePacksAtIndexes:)
    @NSManaged public func removeFromPacks(at indexes: NSIndexSet)

    @objc(replaceObjectInPacksAtIndex:withObject:)
    @NSManaged public func replacePacks(at idx: Int, with value: POSModelPack)

    @objc(replacePacksAtIndexes:withPacks:)
    @NSManaged public func replacePacks(at indexes: NSIndexSet, with values: [POSModelPack])

    @objc(addPacksObject:)
    @NSManaged public func addToPacks(_ value: POSModelPack)

    @objc(removePacksObject:)
    @NSManaged public func removeFromPacks(_ value: POSModelPack)

    @objc(addPacks:)
    @NSManaged public func addToPacks(_ values: NSOrderedSet)

    @objc(removePacks:)
    @NSManaged public func removeFromPacks(_ values: NSOrderedSet)

}
