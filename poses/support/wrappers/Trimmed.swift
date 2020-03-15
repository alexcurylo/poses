// @copyright Trollwerks Inc.

@propertyWrapper struct Trimmed {

    @Formatted({ $0.trimmingCharacters(in: .whitespacesAndNewlines) }) var wrappedValue: String = ""

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
