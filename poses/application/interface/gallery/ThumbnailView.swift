// @copyright Trollwerks Inc.

import SwiftUI

/// ThumbnailView view model
private struct Thumbnail: Identifiable {

    let pose: POSModelPose

    var id: Int32 { pose.id }
    var image: UIImage? { pose.image }
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
        ZStack {
            Image(uiImage: image)
            .resizable()
            .aspectRatio(contentMode: .fit)
        }
    }
}

private extension ThumbnailView {

    var image: UIImage {
        thumbnail.image ?? placeholder
    }

    var placeholder: UIImage {
        // swiftlint:disable:next force_unwrapping
         R.image.photographytips()!
    }
}

/// :nodoc:
struct ThumbnailView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        ThumbnailView(pose: POSModelPose())
    }
}
