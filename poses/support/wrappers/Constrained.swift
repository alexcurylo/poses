// @copyright Trollwerks Inc.

/// Constrain value to a range
@propertyWrapper struct Constrained<Value: Comparable> {

    private var value: Value
    private var range: ClosedRange<Value>

    /// Wrap access in constraints
    var wrappedValue: Value {
        get { value }
        set { value = max(range.lowerBound, min(newValue, range.upperBound)) }
    }

    /// Initialize with value and range
    /// - Parameters:
    ///   - wrappedValue: Value
    ///   - range: Constraints
    init(wrappedValue: Value,
         _ range: ClosedRange<Value>) {
        self.range = range
        self.value = max(range.lowerBound, min(wrappedValue, range.upperBound))
    }
}
