// @copyright Trollwerks Inc.

import SwiftUI

/// SwiftUI favorites tab
struct FavoritesView: View, ServiceProvider {

    @Environment(\.managedObjectContext) private var moc

    @FetchRequest(
        entity: POSModelGroup.entity(),
        sortDescriptors: [NSSortDescriptor(keyPath: \POSModelGroup.order,
                                           ascending: true)],
        animation: .default
    ) private var favorites: FetchedResults<POSModelGroup>
    // swiftlint:disable:previous let_var_whitespace

    /// :nodoc:
    var body: some View {
        NavigationView {
            List {
                ForEach(favorites.dropLast()) { favorite in
                    NavigationLink(destination: GalleryView()) {
                        GroupRowView(group: favorite)
                    }
                }
                .onDelete(perform: delete)
                .onMove(perform: move)
                NavigationLink(destination: GalleryView()) {
                    // swiftlint:disable:next force_unwrapping
                    GroupRowView(group: favorites.last!,
                                 style: .disabled)
                }
            }
            .onAppear {
                self.report.screen(String(Tab.favorites))
            }
            .navigationBarTitle(Tab.favorites.title)
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(
                    action: {
                        withAnimation {
                            //POSModelGroup.create(in: self.moc)
                        }
                    },
                    label: {
                        Image(systemName: "plus")
                    }
                )
            )
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        //.padding() // displays master on iPad portrait launch
        .animation(.default)
    }

    /// unimplemented
    func delete(indices: IndexSet) {
        //self.favorites.delete(at: indices, from: self.moc)
    }

    /// unimplemented
    func move(indices: IndexSet, to: Int) {
    }
}

#if DEBUG
/// :nodoc:
struct FavoritesView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        FavoritesView()
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
#endif
