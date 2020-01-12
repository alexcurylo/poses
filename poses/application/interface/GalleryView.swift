// @copyright Trollwerks Inc.

import SwiftUI

/// SwiftUI gallery tab
struct GalleryView: View, ServiceProvider {

    /// :nodoc:
    var body: some View {
        ZStack {
            Color.red
            Text(String(Tab.gallery))
                .font(.title)
        }
        .onAppear {
            self.report.screen(String(Tab.gallery))
        }
        .animation(.default)
    }
}

#if DEBUG
/// :nodoc:
struct GalleryView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        GalleryView()
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
#endif
