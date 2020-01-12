// @copyright Trollwerks Inc.

import SwiftUI

/// SwiftUI categories tab
struct CategoriesView: View, ServiceProvider {

    /// :nodoc:
    var body: some View {
        ZStack {
            Color.green
            Text(String(Tab.categories))
                .font(.title)
        }
        .onAppear {
            self.report.screen(String(Tab.categories))
        }
        .animation(.default)
    }
}

#if DEBUG
/// :nodoc:
struct CategoriesView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        CategoriesView()
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
#endif
