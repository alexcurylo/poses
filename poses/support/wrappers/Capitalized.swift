// @copyright Trollwerks Inc.

@propertyWrapper struct Capitalized {

    @Formatted({ $0.capitalized }) var wrappedValue: String = ""

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
