// @copyright Trollwerks Inc.

import SwiftUI

/// SwiftUI favorites tab
struct FavoritesView: View {

    /// :nodoc:
    var body: some View {
        ZStack {
            Color.orange
            Text(String(Tab.favorites))
                .font(.title)
        }
    }
}
