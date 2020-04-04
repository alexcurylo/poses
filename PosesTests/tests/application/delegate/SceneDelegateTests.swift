// @copyright Trollwerks Inc.

@testable import Poses
import XCTest

final class SceneDelegateTests: TestCase {

    func testLifecycle() throws {
        // given
        // swiftlint:disable:next force_unwrapping
        let scene = SceneDelegate.hostScene!
        let sut = SceneDelegate()

        // when
        sut.sceneDidBecomeActive(scene)
        sut.sceneWillEnterForeground(scene)
        sut.sceneWillResignActive(scene)
        sut.sceneDidEnterBackground(scene)
        sut.sceneDidDisconnect(scene)
    }
}
