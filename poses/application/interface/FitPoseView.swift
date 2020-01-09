// @copyright Trollwerks Inc.

import SwiftUI

/// SwiftUI fit pose tab
struct FitPoseView: View, ServiceProvider {

    /// :nodoc:
    var body: some View {
        ZStack {
            Color.yellow
            Text(String(Tab.fitPose))
                .font(.title)
        }
        .onAppear {
            self.report.screen(String(Tab.fitPose))
        }
    }
}

/// :nodoc:
struct FitPoseView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        FitPoseView()
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
