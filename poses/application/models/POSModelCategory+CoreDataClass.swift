// @copyright Trollwerks Inc.

import CoreData

/// Seeded category keys
enum CategoryKey: String, CaseIterable {

    /// Known categories in 2.0
    static let categories = 24

    /// ATHLETIC
    case athletic = "ATHLETIC" // 56 poses
    /// CLOSEUP
    case closeup = "CLOSEUP" // 37 poses
    /// CRAWL
    case crawl = "CRAWL" // 55 poses
    /// CROUCH
    case crouch = "CROUCH" // 27 poses
    /// DANCE
    case dance = "DANCE" // 49 poses
    /// KNEELANOBJ
    case kneelObject = "KNEELANOBJ" // 13 poses
    /// KNEELBENCH
    case kneelBench = "KNEELBENCH" // 25 poses
    /// KNEELBOTH
    case kneelBoth = "KNEELBOTH" // 166 poses
    /// KNEELONE
    case kneelOne = "KNEELONE" // 30 poses
    /// RECLINEAIR
    case reclineAir = "RECLINEAIR" // 72 poses
    /// RECLINEBENCH
    case reclineBench = "RECLINEBENCH" // 20 poses
    /// RECLINEBK
    case reclineBack = "RECLINEBK" // 103 poses
    /// RECLINEFT
    case reclineFront = "RECLINEFT" // 70 poses
    /// RECLINESIDE
    case reclineSide = "RECLINESIDE" // 65 poses
    /// SEATBENCH
    case seatedBench = "SEATBENCH" // 106 poses
    /// SEATCHAIR
    case seatedChair = "SEATCHAIR" // 79 poses
    /// SEATFLOOR
    case seatedFloor = "SEATFLOOR" // 170 poses
    /// SEATLEGS
    case seatedLegs = "SEATLEGS" // 115 poses
    /// SEATSTOOL
    case seatedStool = "SEATSTOOL" // 123 poses
    /// STANDBACK
    case standBack = "STANDBACK" // 46 poses
    /// STANDFRONT
    case standFront = "STANDFRONT" // 112 poses
    /// STANDOBJECT
    case standObject = "STANDOBJECT" // 12 poses
    /// STANDSIDE
    case standSide = "STANDSIDE" // 167 poses
    /// WITHPROPS
    case standProps = "WITHPROPS" // 257 poses

    /// Expected pose counts
    var count: Int {
        switch self {
        case .athletic: return 56
        case .closeup: return 37
        case .crawl: return 55
        case .crouch: return 27
        case .dance: return 49
        case .kneelObject: return 13
        case .kneelBench: return 25
        case .kneelBoth: return 166
        case .kneelOne: return 30
        case .reclineAir: return 72
        case .reclineBench: return 20
        case .reclineBack: return 103
        case .reclineFront: return 70
        case .reclineSide: return 65
        case .seatedBench: return 106
        case .seatedChair: return 79
        case .seatedFloor: return 170
        case .seatedLegs: return 115
        case .seatedStool: return 123
        case .standBack: return 46
        case .standFront: return 112
        case .standObject: return 12
        case .standSide: return 167
        case .standProps: return 257
        }
    }
}

/// PosesModel entity
@objc(POSModelCategory) public final class POSModelCategory: NSManagedObject {

    /// Display title
    var title: String { NSLocalizedString(key!, comment: "") }
    // swiftlint:disable:previous force_unwrapping

    /// Display count
    var visible: String { "TODO" }
}

extension POSModelCategory: EntityModel {

    /// EntityModel conformance
    typealias Entity = POSModelCategory

    /// name of entity in store
    static var entityName = "Category"
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
