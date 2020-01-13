// @copyright Trollwerks Inc.

import CoreData

enum CategoryKey: String, CaseIterable {

    case athletic = "ATHLETIC" // 56 poses
    case closeup = "CLOSEUP" // 37 poses
    case crawl = "CRAWL" // 55 poses
    case crouch = "CROUCH" // 27 poses
    case dance = "DANCE" // 49 poses
    case kneelObject = "KNEELANOBJ" // 13 poses
    case kneelBench = "KNEELBENCH" // 25 poses
    case kneelBoth = "KNEELBOTH" // 166 poses
    case kneelOne = "KNEELONE" // 30 poses
    case reclineAir = "RECLINEAIR" // 72 poses
    case reclineBench = "RECLINEBENCH" // 20 poses
    case reclineBack = "RECLINEBK" // 103 poses
    case reclineFront = "RECLINEFT" // 70 poses
    case reclineSide = "RECLINESIDE" // 65 poses
    case seatedBench = "SEATBENCH" // 106 poses
    case seatedChair = "SEATCHAIR" // 79 poses
    case seatedFloor = "SEATFLOOR" // 170 poses
    case seatedLegs = "SEATLEGS" // 115 poses
    case seatedStool = "SEATSTOOL" // 123 poses
    case standBack = "STANDBACK" // 46 poses
    case standFront = "STANDFRONT" // 112 poses
    case standOjbect = "STANDOBJECT" // 12 poses
    case standSide = "STANDSIDE" // 167 poses
    case standProps = "WITHPROPS" // 257 poses
}

/// PosesModel entity
@objc(POSModelCategory) public final class POSModelCategory: NSManagedObject, EntityModel {

    /// EntityModel conformance
    typealias Entity = POSModelCategory

    /// Display title
    var title: String { NSLocalizedString(key!, comment: "") }
    // swiftlint:disable:previous force_unwrapping

    /// Display count
    var visible: String { "TODO" }
}

extension POSModelCategory: Identifiable {

    public var id: String {
        // best: define id: UUID property in schema
        // could use objectID.uriRepresentation().absoluteString,
        // but it's mutable on first save/non-lightweight migration
        // swiftlint:disable:next force_unwrapping
        return key!
    }
}
