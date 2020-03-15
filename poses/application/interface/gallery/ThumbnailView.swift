// @copyright Trollwerks Inc.

import SwiftUI

/// ThumbnailView view model
struct Thumbnail: Identifiable {

    let number: Int
    let id = UUID()
    let color: Color = .red
}

/// View in a gallery grid
struct ThumbnailView: View {

    /// View model
    let thumbnail: Thumbnail

    private let title: String
    private let color: Color

    /// :nodoc:
    init(thumbnail: Thumbnail) {
        self.thumbnail = thumbnail
        title = String(thumbnail.number)
        color = thumbnail.color
    }

    /// :nodoc:
    var body: some View {
        ZStack(alignment: .init(horizontal: .center, vertical: .center)) {
            Rectangle()
                .foregroundColor(color)
            Text(title)
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
        ThumbnailView(thumbnail: Thumbnail(number: 1))
    }
}
