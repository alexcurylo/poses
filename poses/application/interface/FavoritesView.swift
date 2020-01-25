// @copyright Trollwerks Inc.

#if canImport(Introspect)
import Introspect
#endif
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

    private var enabled: [POSModelGroup] {
        favorites.dropLast()
    }
    private var disabled: [POSModelGroup] {
        [favorites.last].compactMap { $0 }
    }

    @State private var name = ""
    @State private var isAdding = false {
        didSet { if !isAdding { name = "" } }
    }

    /// :nodoc:
    var body: some View {
        // swiftlint:disable:next closure_body_length
        NavigationView {
            #if os(iOS)
            Form {
                if isAdding {
                    Section(header: Text(L.addGroup())) {
                        TextField(L.groupName(),
                                  text: $name,
                                  onCommit: add)
                        .introspectTextField {
                            $0.returnKeyType = .done
                            $0.becomeFirstResponder()
                        }
                    }
                }
                Section {
                    ForEach(enabled) { favorite in
                        NavigationLink(destination: GalleryView()) {
                            GroupRowView(group: favorite)
                        }
                    }
                    .onDelete(perform: withAnimation { delete })
                    .onMove(perform: withAnimation { move })
                    ForEach(disabled) { trash in
                        NavigationLink(destination: GalleryView()) {
                            GroupRowView(group: trash,
                                         style: .disabled)
                        }
                    }
                }
            }
            .onAppear(perform: appear)
            .navigationBarTitle(Tab.favorites.title)
            .navigationBarItems(
                leading: EditButton(),
                trailing: AddButton(isAdding: isAdding,
                                    action: withAnimation { toggleAdding })
            )
            #endif
        }
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .animation(.default)
    }

    private func appear() {
        report.screen(String(Tab.favorites))
    }

    private func toggleAdding() {
        isAdding.toggle()
    }

    private func add() {
        let entered = name
        isAdding = false
        guard !entered.isEmpty else { return }

        let existing = favorites.count
        let new = POSModelGroup(context: moc)
        new.set(unique: entered)
        new.order = Int32(existing)

        data.save(moc: moc)
    }

    /// unimplemented
    func delete(indices: IndexSet) {
        print("deleted")
        //self.favorites.delete(at: indices, from: self.moc)
        // OrderableManagedObjectProtocol
        // unimplemented: items.delete(managedObjectContext)
    }

    /// unimplemented
    func move(indices: IndexSet, to: Int) {
        print("move")
        // OrderableManagedObjectProtocol
        // unimplemented: items.move(managedObjectContext))
    }

    /// unimplemented
    //func rename() {}
}

/// :nodoc:
struct FavoritesView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        FavoritesView()
        .environment(\.managedObjectContext, CoreDataStack.shared.moc)
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
