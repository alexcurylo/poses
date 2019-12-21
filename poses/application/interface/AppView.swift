// @copyright Trollwerks Inc.

import SFSafeSymbols
import SwiftUI

/// SwiftUI application tab controller
struct AppView: View {

    @State private var selection = 0

    /// :nodoc:
    var body: some View {
        // swiftlint:disable:next closure_body_length
        TabView(selection: $selection) {
            GalleryView()
                .tabItem {
                    VStack {
                        Image(systemSymbol: .photoOnRectangle)
                        Text(String(Tab.gallery))
                    }
                }
                .tag(Tab.gallery.tag)
            CategoriesView()
                .tabItem {
                    VStack {
                        Image(systemSymbol: .tag)
                        Text(String(Tab.categories))
                    }
                }
                .tag(Tab.categories.tag)
            FavoritesView()
                .tabItem {
                    VStack {
                        Image(systemSymbol: .star)
                        Text(String(Tab.favorites))
                    }
                }
                .tag(Tab.favorites.tag)
            FitPoseView()
                .tabItem {
                    VStack {
                        Image(systemSymbol: .camera)
                        Text(String(Tab.fitPose))
                    }
                }
                .tag(Tab.fitPose.tag)
            ExtrasView()
                .tabItem {
                    VStack {
                        Image(systemSymbol: .tray2)
                        Text(String(Tab.extras))
                    }
                }
                .tag(Tab.extras.tag)
        }
    }
}

/// :nodoc:
struct AppView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        AppView()
        //AppView().environment(\.colorScheme, .dark)
        //AppView().environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
        //NavigationView { AppView() }
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
