// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// SwiftUI categories tab
struct CategoriesView: View, ServiceProvider {

    @FetchRequest(
        entity: POSModelCategory.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \POSModelCategory.key,
                                           ascending: true), ],
        animation: .default
    ) private var categories: FetchedResults<POSModelCategory>
    // swiftlint:disable:previous let_var_whitespace

    // Need to disable FR and \.managedObjectContext for previewing?
    // private var categories: [GroupRowSample] = []

    /// :nodoc:
    var body: some View {
        NavigationView {
            List {
                ForEach(categories) { category in
                    NavigationLink(destination: GalleryView(request: .category(category))) {
                        GroupRowView(group: category)
                    }
                }
            }
            .onAppear(perform: appear)
            .navigationBarTitle(Tab.categories.title)
        }
        .navigationViewStyle(StackNavigationViewStyle())
        //.navigationViewStyle(DoubleColumnNavigationViewStyle())
        //.padding() // displays master on iPad portrait launch
        .animation(.default)
    }
}

private extension CategoriesView {

    private func appear() {
        report.screen(String(Tab.categories))
    }
}

/// :nodoc:
struct CategoriesView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        CategoriesView()
        .environment(\.managedObjectContext, CoreDataStack.shared.moc)
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
