// @copyright Trollwerks Inc.

extension NSObject {

    /// Post a local notification using `NotificationCenter.default
    /// - Parameters:
    ///   - name: Notification name
    ///   - userInfo: Info dictionary
    func notify(name: Notification.Name,
                userInfo: [AnyHashable: Any] = [:]) {
        NotificationCenter.default.post(name: name,
                                        object: self,
                                        userInfo: userInfo)
    }

    /// Observe a notification
    /// - Parameters:
    ///   - name: Notification name
    ///   - selector: Observing function
    ///   - object: Object to observe
    func observe(notification name: Notification.Name,
                 selector: Selector,
                 object: Any? = nil) {
        NotificationCenter.default.addObserver(
            self,
            selector: selector,
            name: name,
            object: object
        )
    }
}
