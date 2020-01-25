// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// display provider
protocol GroupRowModel {

    /// Display title
    var title: String { get }
    /// Display count
    func visible(in moc: NSManagedObjectContext) -> String

    /// for debugging
    var order: Int32 { get }
}

/// Group row
 struct GroupRowView: View {

    @Environment(\.managedObjectContext) private var moc

    //@Environment(\.editMode) private var editMode
    //private var isEditing: Bool { editMode?.wrappedValue == .active }

    /// Rendering style
    enum Style {

        /// Editable/movable/deletable
        case enabled
        /// Trash, not editable/movable/deletable
        case disabled
    }

    /// Displayed group
    let group: GroupRowModel
    /// Editable or not editable appearance
    var style: Style = .enabled

    private var titleColor: Color {
        switch style {
        case .enabled: return .primary
        case .disabled: return .gray
        }
    }

    private var badgeColor: Color {
        switch style {
        case .enabled: return Color(R.color.badge() ?? .gray)
        case .disabled: return .gray
        }
    }

    //@State private var renamed = "Whatever"

    var body: some View {
        HStack {
            /*
            if isEditing {
                TextField(L.groupName(),
                          text: $renamed,
                          onCommit: rename)
                .foregroundColor(titleColor)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .introspectTextField {
                    $0.returnKeyType = .done
                }
            } else {
                //Text("\(group.order). \(group.title)")
                Text(group.title)
                .foregroundColor(titleColor)
            }
            */
            Text(group.title)
            .foregroundColor(titleColor)
            Spacer()
            Text(" \(group.visible(in: moc)) ")
            .font(.system(.footnote, design: .monospaced))
            .bold()
            .foregroundColor(Color.white)
            .padding(2)
            .frame(minWidth: 40)
            .background(Capsule().fill(badgeColor))
            .padding(.trailing, 6)
        }
    }

    //private func rename() { }
}

/// :nodoc:
struct GroupRowView_Previews: PreviewProvider {

    private struct Sample: GroupRowModel, Identifiable {

        let id = UUID()
        let title = "Group Row Sample"
        let order = Int32(1)

        func visible(in moc: NSManagedObjectContext) -> String { "99" }
    }

    /// :nodoc:
    static var previews: some View {
        Group {
            GroupRowView(group: Sample())
            .previewLayout(.fixed(width: 320, height: 44))
            GroupRowView(group: Sample())
            .previewLayout(.fixed(width: 375, height: 44))
        }
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
