// @copyright Trollwerks Inc.

extension UIView {

    /// UIGestureRecognizer typed locator
    /// - Parameters:
    ///   - T: Type to locate
    func gestureRecognizerOfType<T: UIGestureRecognizer>(
        _: T.Type
    ) -> UIGestureRecognizer? {
        if let gestureRecognizers = gestureRecognizers {
            for gestureRecognizer in gestureRecognizers {
                if let tRecognizer = gestureRecognizer as? T {
                    return tRecognizer as UIGestureRecognizer
                }
            }
        }
        return nil
    }
}

extension UIGestureRecognizer {

    /// Removal convenientce
    func removeFromView() {
        view?.removeGestureRecognizer(self)
    }
}

/// Tap recognizer that avoids controls
class EmptyTapGestureRecognizer: UITapGestureRecognizer, UIGestureRecognizerDelegate {

    override init(target: Any?, action: Selector?) {
        super.init(target: target, action: action)

        cancelsTouchesInView = false
        delegate = self
    }

    /// Delegate function to avoid control masking
    /// - Parameters:
    ///   - gestureRecognizer: Self
    ///   - touch: Touch to test
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer,
                           shouldReceive touch: UITouch) -> Bool {
        !(touch.view is UIControl)
    }
}

/// Tagging class for locating camera tapper
class CameraTapper: EmptyTapGestureRecognizer {}

/// Tagging class for locating camera pincher
class CameraPincher: UIPinchGestureRecognizer {}
