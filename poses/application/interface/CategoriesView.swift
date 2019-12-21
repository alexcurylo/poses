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
    }
}
