// @copyright Trollwerks Inc.

import CoreData

/// Packs defined
enum PackKey: String, CaseIterable {

    /// Known packs in 2.0
    static let packs = 30

    // Embedded

    /// kOldFemaleVol1, 368 poses
    case femalevol1
    /// kOldFemaleVol2, 368 poses
    case femalevol2
    /// kOldFemaleVol3, 368 poses
    case femalevol3
    /// kOldPro10, 275 poses
    case pro
    /// Poses Sampler, 24 poses
    case sample
    /// Poses Pro 2, 191 poses
    case pro2

    // Purchasable

    /// 2.0 purchasable, 99 poses
    case female001paid
    /// 2.0 purchasable, 99 poses
    case female002paid
    /// 2.0 purchasable, 99 poses
    case female003paid
    /// 2.0 purchasable, 99 poses
    case female004paid
    /// 2.0 purchasable, 99 poses
    case female005paid
    /// 2.0 purchasable, 99 poses
    case female006paid
    /// 2.0 purchasable, 99 poses
    case female007paid
    /// 2.0 purchasable, 99 poses
    case female008paid
    /// 2.0 purchasable, 99 poses
    case female009paid
    /// 2.0 purchasable, 99 poses
    case female010paid
    /// 2.0 purchasable, 99 poses
    case female011paid
    /// 2.0 purchasable, 99 poses
    case female012paid
    /// 2.0 reward, 99 poses
    case female001free
    /// 2.0 reward, 99 poses
    case female002free
    /// 2.0 reward, 99 poses
    case female003free
    /// 2.0 reward, 99 poses
    case female004free
    /// 2.0 reward, 99 poses
    case female005free
    /// 2.0 reward, 99 poses
    case female006free
    /// 2.0 reward, 99 poses
    case female007free
    /// 2.0 reward, 99 poses
    case female008free
    /// 2.0 reward, 99 poses
    case female009free
    /// 2.0 reward, 99 poses
    case female010free
    /// 2.0 reward, 99 poses
    case female011free
    /// 2.0 reward, 99 poses
    case female012free

    /// Expected pack counts
    var count: Int {
        switch self {
        case .femalevol1,
             .femalevol2,
             .femalevol3:
            return 368
        case .pro:
            return 275
        case .sample:
            return 24
        case .pro2:
            return 191
        default:
            return 99
        }
    }
}

/// PosesModel entity
@objc(POSModelPack) public final class POSModelPack: NSManagedObject {
}

extension POSModelPack: EntityModel {

    /// EntityModel conformance
    typealias Entity = POSModelPack

    /// name of entity in store
    static var entityName = "Pack"
}
