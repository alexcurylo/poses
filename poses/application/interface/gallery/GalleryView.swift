// @copyright Trollwerks Inc.

import Grid
import SwiftUI

/// SwiftUI gallery tab
struct GalleryView: View, ServiceProvider {

    /// fetch request for `VisiblePoses` template
    @FetchRequest(
        entity: POSModelPose.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \POSModelPose.number,
                                           ascending: true), ],
        predicate: NSPredicate(format: "visible == YES"),
        animation: .default
    ) private var poses: FetchedResults<POSModelPose>
    // swiftlint:disable:previous let_var_whitespace

    private let style = ModularGridStyle(.vertical,
                                         columns: .min(135),
                                         rows: .min(135),
                                         spacing: 1)

    /// :nodoc:
    var body: some View {
        NavigationView {
            ScrollView(style.axes) {
                Grid(poses) { pose in
                    ThumbnailView(pose: pose)
                }
                .padding(4)
                .gridStyle(style)
            }
            .onAppear(perform: appear)
            .navigationBarTitle(L.screenGallery(poses.count))
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
