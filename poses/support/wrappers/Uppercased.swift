// @copyright Trollwerks Inc.

@propertyWrapper struct Uppercased {

    @Formatted({ $0.uppercased() }) var wrappedValue: String = ""

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue
    }
}
