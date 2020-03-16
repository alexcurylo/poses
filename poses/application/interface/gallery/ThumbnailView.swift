// @copyright Trollwerks Inc.

import SwiftUI

/// ThumbnailView view model
private struct Thumbnail: Identifiable {

    let pose: POSModelPose

    var id: Int32 { pose.id }
    var title: String { String(pose.number) }
}

/// View in a gallery grid
struct ThumbnailView: View {

    /// View model
    private let thumbnail: Thumbnail

    /// :nodoc:
    init(pose: POSModelPose) {
        self.thumbnail = Thumbnail(pose: pose)
    }

    /// :nodoc:
    var body: some View {
        ZStack(alignment: .init(horizontal: .center, vertical: .center)) {
            Rectangle()
                .foregroundColor(.red)
            Text(thumbnail.title)
                .font(.title)
                .foregroundColor(.white)
                .opacity(0.5)
        }
        .overlay(
            RoundedRectangle(cornerRadius: 16)
                .strokeBorder(Color.white.opacity(0.3), lineWidth: 4)
        )
        .cornerRadius(16)
    }
}

/// :nodoc:
struct ThumbnailView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        ThumbnailView(pose: POSModelPose())
    }
}
