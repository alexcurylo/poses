// @copyright Trollwerks Inc.

/// Format a value
@propertyWrapper struct Formatted<Value> {

    private var value: Value
    private var formatter: (Value) -> Value

    /// Wrap access in formatting
    var wrappedValue: Value {
        get { value }
        set { value = formatter(newValue) }
    }

    /// Initalize with value and formatter
    /// - Parameters:
    ///   - wrappedValue: Value
    ///   - formatter: Formatting closure
    init(wrappedValue: Value,
         _ formatter: @escaping (Value) -> Value) {
        self.formatter = formatter
        self.value = formatter(wrappedValue)
    }
}
