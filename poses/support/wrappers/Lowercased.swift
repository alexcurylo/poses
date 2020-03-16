// @copyright Trollwerks Inc.

/// Lowercase the wrapped value
@propertyWrapper struct Lowercased {

    /// Lowercased value
    @Formatted({ $0.lowercased() }) var wrappedValue: String = ""

    /// :nodoc:
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
