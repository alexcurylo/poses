// @copyright Trollwerks Inc.

import Grid
import SwiftUI

/// SwiftUI gallery tab
struct GalleryView: View, ServiceProvider {

    /// pose request to fetch
    enum Request {

        /// `VisiblePosesInCategory` template
        case category(POSModelCategory)
        /// `VisiblePosesInGroup` template
        case group(POSModelGroup)
        /// `VisiblePoses` template
        case visible

        fileprivate var predicate: NSPredicate {
            let visible = NSPredicate(format: "visible == YES")
            switch self {
            case .category(let category):
                let subs = ["keyed": category.key ?? ""]
                let keyed = NSPredicate(format: "ANY categories.key == $keyed")
                            .withSubstitutionVariables(subs)
                return NSCompoundPredicate(andPredicateWithSubpredicates: [visible, keyed])
            case .group(let group):
                let subs = ["named": group.name ?? ""]
                let named = NSPredicate(format: "ANY groups.name == $named")
                                        .withSubstitutionVariables(subs)
                return NSCompoundPredicate(andPredicateWithSubpredicates: [visible, named])
            case .visible:
                return visible
            }
        }

        fileprivate var sortDescriptors: [NSSortDescriptor] {
            [ NSSortDescriptor(keyPath: \POSModelPose.number, ascending: true), ]
        }

        fileprivate func title(count: Int) -> String {
            L.screenGallery(count)
        }
    }

    private let request: Request
    @FetchRequest private var poses: FetchedResults<POSModelPose>

    private let style = ModularGridStyle(.vertical,
                                         columns: .min(135),
                                         rows: .min(135),
                                         spacing: 1)

    init(request: Request) {
        self.request = request
        _poses = FetchRequest(
            entity: POSModelPose.entity(),
            sortDescriptors: request.sortDescriptors,
            predicate: request.predicate,
            animation: .default
        )
    }

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
            .navigationBarTitle(request.title(count: poses.count))
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
        GalleryView(request: .visible)
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
