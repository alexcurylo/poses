// @copyright Trollwerks Inc.

import CoreData
import SwiftUI

/// display provider
protocol GroupRowModel {

    /// Display title
    var title: String { get }
    /// Display count
    func visible(in moc: NSManagedObjectContext) -> String
}

/// Group row
 struct GroupRowView: View {

    @Environment(\.managedObjectContext) private var moc

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

    var body: some View {
        HStack {
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
}

#if DEBUG

struct GroupRowSample: GroupRowModel, Identifiable {

    let id = UUID()
    let title = "Group Row Sample"

    func visible(in moc: NSManagedObjectContext) -> String { "99" }
}

/// :nodoc:
struct GroupRowView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        Group {
            GroupRowView(group: GroupRowSample())
            .previewLayout(.fixed(width: 320, height: 44))
            GroupRowView(group: GroupRowSample())
            .previewLayout(.fixed(width: 375, height: 44))
        }
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
#endif
