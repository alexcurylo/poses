// @copyright Trollwerks Inc.

import CoreData
@testable import Poses
import XCTest

final class DataServiceTests: TestCase {

    func testCoreData() throws {
        // given
        let sut = DataServiceImpl()
        let loaded = expectation(description: "loaded")
        sut.loaded = { _, _ in loaded.fulfill() }

        // when
        let context = sut.viewContext
        sut.save()
        let result = XCTWaiter.wait(for: [loaded], timeout: 5)

        // then
        XCTAssertEqual(result, .completed)
        XCTAssertFalse(context.hasChanges)
    }

    func testStub() throws {
        // given
        let sut = DataServiceStub()

        // when
        let context = sut.viewContext
        sut.save()

        // then
        XCTAssertFalse(context.hasChanges)
    }

    func testSeed() throws {
        // given
        let sut = DataServiceImpl()
        let loaded = expectation(description: "loaded")
        sut.loaded = { _, _ in loaded.fulfill() }

        // when
        let moc = sut.viewContext
        let result = XCTWaiter.wait(for: [loaded], timeout: 5)
        XCTAssertEqual(result, .completed)
        let categories = try moc.fetch(Category.request)
        let groups = try moc.fetch(Group.request)
        let poses = try moc.fetch(Pack.request)
        let packs = try moc.fetch(Pose.request)

        // then
        XCTAssertEqual(categories.count, 24)
        XCTAssertEqual(groups.count, 0)
        XCTAssertEqual(packs.count, 30)
        XCTAssertEqual(poses.count, 99 * 12 + 191) // = 1379
    }
}
    /* categories
    > RECLINEAIR: 72 poses
    > CROUCH: 27 poses
    > KNEELBENCH: 25 poses
    > RECLINESIDE: 65 poses
    > KNEELONE: 30 poses
    > CLOSEUP: 37 poses
    > STANDOBJECT: 12 poses
    > ATHLETIC: 56 poses
    > WITHPROPS: 257 poses
    > KNEELBOTH: 166 poses
    > STANDSIDE: 167 poses
    > SEATBENCH: 106 poses
    > SEATCHAIR: 79 poses
    > SEATFLOOR: 170 poses
    > STANDFRONT: 112 poses
    > RECLINEBENCH: 20 poses
    > DANCE: 49 poses
    > RECLINEFT: 70 poses
    > RECLINEBK: 103 poses
    > CRAWL: 55 poses
    > SEATLEGS: 115 poses
    > KNEELANOBJ: 13 poses
    > SEATSTOOL: 123 poses
    > STANDBACK: 46 poses
    (visible: 190 poses)
    */

/* packs
    twassert([self pack:kOldFemaleVol1].poses.count == 368);
    twassert([self pack:kOldFemaleVol2].poses.count == 368);
    twassert([self pack:kOldFemaleVol3].poses.count == 368);
    twassert([self pack:kOldPro10].poses.count == 275);
    twassert([self pack:@"sample"].poses.count == 24);
    twassert([self pack:@"pro2"].poses.count == 191);
    twassert([self pack:@"female001paid"].poses.count == 99);
    twassert([self pack:@"female002paid"].poses.count == 99);
    twassert([self pack:@"female003paid"].poses.count == 99);
    twassert([self pack:@"female004paid"].poses.count == 99);
    twassert([self pack:@"female005paid"].poses.count == 99);
    twassert([self pack:@"female006paid"].poses.count == 99);
    twassert([self pack:@"female007paid"].poses.count == 99);
    twassert([self pack:@"female008paid"].poses.count == 99);
    twassert([self pack:@"female009paid"].poses.count == 99);
    twassert([self pack:@"female010paid"].poses.count == 99);
    twassert([self pack:@"female011paid"].poses.count == 99);
    twassert([self pack:@"female012paid"].poses.count == 99);
    twassert([self pack:@"female001free"].poses.count == 99);
    twassert([self pack:@"female002free"].poses.count == 99);
    twassert([self pack:@"female003free"].poses.count == 99);
    twassert([self pack:@"female004free"].poses.count == 99);
    twassert([self pack:@"female005free"].poses.count == 99);
    twassert([self pack:@"female006free"].poses.count == 99);
    twassert([self pack:@"female007free"].poses.count == 99);
    twassert([self pack:@"female008free"].poses.count == 99);
    twassert([self pack:@"female009free"].poses.count == 99);
    twassert([self pack:@"female010free"].poses.count == 99);
    twassert([self pack:@"female011free"].poses.count == 99);
    twassert([self pack:@"female012free"].poses.count == 99);
*/
