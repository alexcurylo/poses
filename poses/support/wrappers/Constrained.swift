// @copyright Trollwerks Inc.

@propertyWrapper struct Constrained<Value: Comparable> {

    var value: Value
    var range: ClosedRange<Value>

    var wrappedValue: Value {
        get { value }
        set { value = max(range.lowerBound, min(newValue, range.upperBound)) }
    }

    init(wrappedValue: Value, _ range: ClosedRange<Value>) {
        self.range = range
        self.value = max(range.lowerBound, min(wrappedValue, range.upperBound))
    }
}
