// @copyright Trollwerks Inc.

/// Capitalize the wrapped value
@propertyWrapper struct Capitalized {

    /// Capitalized value
    @Formatted({ $0.capitalized }) var wrappedValue: String = ""

    /// :nodoc:
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
