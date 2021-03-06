// @copyright Trollwerks Inc.

extension Array {

    /// Extract members of types
    /// - Parameter type: Desired type
    /// - Returns: Array of all members of type
    func of<T>(type: T.Type) -> [T] {
        lazy.compactMap { $0 as? T }
    }

    /// Extract first member of types
    /// - Parameter type: Desired type
    /// - Returns: First member of type if any
    func firstOf<T>(type: T.Type) -> T? {
        lazy.compactMap { $0 as? T }.first
    }

    /// Sorting helper
    /// - Parameter element: Array element
    /// - Parameter isOrderedBefore: Order evaluation
    func insertionIndex(
        of element: Element,
        isOrderedBefore: (Element, Element) -> Bool) -> (index: Int, alreadyExists: Bool
    ) {
        var lowIndex = 0
        var highIndex = self.count - 1

        while lowIndex <= highIndex {
            let midIndex = (lowIndex + highIndex) / 2
            if isOrderedBefore(self[midIndex], element) {
                lowIndex = midIndex + 1
            } else if isOrderedBefore(element, self[midIndex]) {
                highIndex = midIndex - 1
            } else {
                return (midIndex, true)
            }
        }

        return (lowIndex, false)
    }

    /// Chunk array into columns
    /// - Parameter columns: Number of columns
    func chunked(into size: Int) -> [[Element]] {
        stride(from: 0, to: count, by: size).map {
            Array(self[$0..<Swift.min($0 + size, count)])
        }
    }
}

extension Set {

    /// Extract members of types
    /// - Parameter type: Desired type
    /// - Returns: Array of all members of type
    func of<T>(type: T.Type) -> [T] {
        lazy.compactMap { $0 as? T }
    }
}
