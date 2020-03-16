// @copyright Trollwerks Inc.

/// Clamp the wrapped value to unit interval
@propertyWrapper struct UnitInterval<Value> where Value: FloatingPoint {

    /// Constrained value
    @Constrained(0...1) var wrappedValue: Value = .zero

    /// :nodoc:
    init(wrappedValue: Value) {
        self.wrappedValue = wrappedValue
    }
}

/// :nodoc:
extension UnitInterval: Codable where Value: Codable {

    /// :nodoc:
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let value = try container.decode(Value.self)
        self.init(wrappedValue: value)
    }

    /// :nodoc:
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encode(self.wrappedValue)
    }
}
