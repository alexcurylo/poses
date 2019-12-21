// @copyright Trollwerks Inc.

import SwiftUI

/// SwiftUI extras tab
struct ExtrasView: View, ServiceProvider {

    /// :nodoc:
    var body: some View {
        ZStack {
            Color.blue
            Text(String(Tab.extras))
                .font(.title)
        }
        .onAppear {
            self.report.screen(String(Tab.extras))
        }
    }
}
