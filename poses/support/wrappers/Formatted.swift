// @copyright Trollwerks Inc.

@propertyWrapper struct Formatted<Value> {

    var value: Value
    var formatter: (Value) -> Value

    var wrappedValue: Value {
        get { value }
        set { value = formatter(newValue) }
    }

    init(wrappedValue: Value, _ formatter: @escaping (Value) -> Value) {
        self.formatter = formatter
        self.value = formatter(wrappedValue)
    }
}
