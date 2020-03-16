// @copyright Trollwerks Inc.

/// Uppercase the wrapped value
@propertyWrapper struct Uppercased {

    /// Uppercased value
    @Formatted({ $0.uppercased() }) var wrappedValue: String = ""

    /// :nodoc:
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
