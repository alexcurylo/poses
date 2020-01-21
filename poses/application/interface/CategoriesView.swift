// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// SwiftUI categories tab
struct CategoriesView: View, ServiceProvider {

    @FetchRequest(
        entity: POSModelCategory.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \POSModelCategory.key,
                                           ascending: true)],
        animation: .default
    ) private var categories: FetchedResults<POSModelCategory>
    // swiftlint:disable:previous let_var_whitespace

    // Need to disable FR and \.managedObjectContext for previewing?
    //private var categories: [GroupRowSample] = []

    /// :nodoc:
    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    NavigationLink(destination: GalleryView()) {
                        GroupRowView(group: category)
                    }
                }
            }
            .onAppear {
                self.report.screen(String(Tab.categories))
            }
            .navigationBarTitle(Tab.categories.title)
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        //.padding() // displays master on iPad portrait launch
        .animation(.default)
    }
}

#if DEBUG
/// :nodoc:
struct CategoriesView_Previews: PreviewProvider {

    /// :nodoc:
    static var moc: NSManagedObjectContext {
        Services().data.viewContext
    }

    /// :nodoc:
    static var previews: some View {
        CategoriesView()
        //.environment(\.managedObjectContext, moc)
        //.onAppear { Services().data.seed() }
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
#endif
