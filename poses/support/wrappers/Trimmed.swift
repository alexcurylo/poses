// @copyright Trollwerks Inc.

/// Trim the wrapped value
@propertyWrapper struct Trimmed {

    /// Trimmed value
    @Formatted({ $0.trimmingCharacters(in: .whitespacesAndNewlines) }) var wrappedValue: String = ""

    /// :nodoc:
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
