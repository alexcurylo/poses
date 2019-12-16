// @copyright Trollwerks Inc.
//

import Foundation
import CoreData


extension Pose {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pose> {
        return NSFetchRequest<Pose>(entityName: "Pose")
    }

    @NSManaged public var cached: NSNumber?
    @NSManaged public var embedded: NSNumber?
    @NSManaged public var number: NSNumber?
    @NSManaged public var rating: NSNumber?
    @NSManaged public var thumbnailed: NSNumber?
    @NSManaged public var trashed: NSNumber?
    @NSManaged public var visible: NSNumber?
    @NSManaged public var categories: NSSet?
    @NSManaged public var groups: NSSet?
    @NSManaged public var packs: NSSet?

}

// MARK: Generated accessors for categories
extension Pose {

    @objc(addCategoriesObject:)
    @NSManaged public func addToCategories(_ value: Category)

    @objc(removeCategoriesObject:)
    @NSManaged public func removeFromCategories(_ value: Category)

    @objc(addCategories:)
    @NSManaged public func addToCategories(_ values: NSSet)

    @objc(removeCategories:)
    @NSManaged public func removeFromCategories(_ values: NSSet)

}

// MARK: Generated accessors for groups
extension Pose {

    @objc(addGroupsObject:)
    @NSManaged public func addToGroups(_ value: Group)

    @objc(removeGroupsObject:)
    @NSManaged public func removeFromGroups(_ value: Group)

    @objc(addGroups:)
    @NSManaged public func addToGroups(_ values: NSSet)

    @objc(removeGroups:)
    @NSManaged public func removeFromGroups(_ values: NSSet)

}

// MARK: Generated accessors for packs
extension Pose {

    @objc(addPacksObject:)
    @NSManaged public func addToPacks(_ value: Pack)

    @objc(removePacksObject:)
    @NSManaged public func removeFromPacks(_ value: Pack)

    @objc(addPacks:)
    @NSManaged public func addToPacks(_ values: NSSet)

    @objc(removePacks:)
    @NSManaged public func removeFromPacks(_ values: NSSet)

}
