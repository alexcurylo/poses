// @copyright Trollwerks Inc.

import SwiftUI

/// Button for toggling add form section visibility
struct AddButton: View {

    typealias Action = () -> Void

    private var isAdding: Bool
    private var action: Action

    /// Initializer
    /// - Parameters:
    ///   - isAdding: Add form display toggle
    ///   - action: Trigger action
    init(isAdding: Bool,
         action: @escaping Action) {
        self.isAdding = isAdding
        self.action = action
    }

    /// :nodoc:
    var body: some View {
        Button(action: action) {
            if isAdding {
                Text(L.cancel())
            } else {
                Image(systemSymbol: .plus)
            }
        }
    }
}

/// :nodoc:
struct AddButton_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        AddButton(isAdding: false) {}
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
