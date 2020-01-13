// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// Categories row
 struct CategoryRow: View {

    var category: POSModelCategory

    var body: some View {
        Text(category.title)
    }
}

/// SwiftUI categories tab
struct CategoriesView: View, ServiceProvider {

    //@Environment(\.managedObjectContext) private var context

    @FetchRequest(
        entity: POSModelCategory.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \POSModelCategory.key,
                                           ascending: true)],
        animation: .default
    ) private var categories: FetchedResults<POSModelCategory>
    // swiftlint:disable:previous let_var_whitespace

    /// :nodoc:
    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    NavigationLink(destination: GalleryView()) {
                        CategoryRow(category: category)
                    }
                }
            }
            .onAppear {
                self.report.screen(String(Tab.categories))
            }
            .navigationBarTitle(String(Tab.categories))
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
