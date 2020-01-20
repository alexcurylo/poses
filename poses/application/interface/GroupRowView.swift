// @copyright Trollwerks Inc.

import SwiftUI

/// display provider
protocol GroupRowModel {

    /// Display title
    var title: String { get }
    /// Display count
    var visible: String { get }
}

/// Group row
 struct GroupRowView: View {

    /// Group being displayed
    var group: GroupRowModel

    var body: some View {
        HStack {
            Text(group.title)
            Spacer()
            Text(" \(group.visible) ")
            .font(.system(.footnote, design: .monospaced))
            .bold()
            .foregroundColor(Color.white)
            .padding(2)
            .frame(minWidth: 40)
            .background(Capsule().fill(Color(red: 0.530,
                                             green: 0.600,
                                             blue: 0.738)))
            .padding(.trailing, 6)
        }
    }
}

#if DEBUG

struct GroupRowSample: GroupRowModel, Identifiable {

    let id = UUID()
    let title = "Group Row Sample"
    let visible = "99"
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
