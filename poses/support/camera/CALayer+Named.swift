// @copyright Trollwerks Inc.

extension CALayer {

    /// Returns named sublayer if present
    /// - Parameter name: name
    func sublayer(named name: String) -> CALayer? {
        sublayers?.first { $0.name == name }
    }

    /// Insert background layer
    /// - Parameters:
    ///   - layer: layer to insert
    ///   - name: Optional layer name
    func insert(background layer: CALayer,
                name: String? = nil) {
        layer.frame = bounds
        insertSublayer(layer, at: 0)
        if let name = name {
            layer.name = name
        }
    }
}
