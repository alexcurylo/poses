// @copyright Trollwerks Inc.

@propertyWrapper struct UnitInterval<Value> where Value: FloatingPoint {

    @Constrained(0...1) var wrappedValue: Value = .zero

    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}

extension UnitInterval: Codable where Value: Codable {

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Value.self)
        self.init(wrappedValue: value)
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.wrappedValue)
    }
}
