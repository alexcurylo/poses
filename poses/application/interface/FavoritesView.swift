// @copyright Trollwerks Inc.

import SwiftUI

/// SwiftUI favorites tab
struct FavoritesView: View, ServiceProvider {

    @Environment(\.managedObjectContext) private var context

    /// :nodoc:
    var body: some View {
        ZStack {
            Color.orange
            Text(String(Tab.favorites))
                .font(.title)
        }
        .onAppear {
            self.report.screen(String(Tab.favorites))
        }
        .animation(.default)
    }
}

#if DEBUG
/// :nodoc:
struct FavoritesView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        FavoritesView()
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
#endif
