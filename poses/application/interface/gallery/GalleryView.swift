// @copyright Trollwerks Inc.

import Grid
import SwiftUI

/// SwiftUI gallery tab
struct GalleryView: View, ServiceProvider {

    @State private var thumbnails: [Thumbnail] = (0...100).map { Thumbnail(number: $0) }
    @State private var style = ModularGridStyle(.vertical,
                                                columns: .min(135),
                                                rows: .min(135))

    /// :nodoc:
    var body: some View {
        NavigationView {
            ScrollView(style.axes) {
                Grid(thumbnails) { thumbnail in
                    ThumbnailView(thumbnail: thumbnail)
                }
                .padding(4)
                .gridStyle(style)
            }
            .onAppear(perform: appear)
            .navigationBarTitle(L.screenGallery(thumbnails.count))
        }
        .navigationViewStyle(StackNavigationViewStyle())
        .animation(.default)
    }
}

private extension GalleryView {

    func appear() {
        report.screen(String(Tab.gallery))
    }
}

/// :nodoc:
struct GalleryView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        GalleryView()
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
