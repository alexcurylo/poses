// @copyright Trollwerks Inc.

@propertyWrapper struct Lowercased {

    @Formatted({ $0.lowercased() }) var wrappedValue: String = ""

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
