// @copyright Trollwerks Inc.

// https://pspdfkit.com/blog/2018/smart-grid-sizing/

/// Utilities for calculating size of thumbnails and the like
enum Sizing {

    /// Returns an appropriate size for page thumbnails.
    ///
    /// - Parameters:
    ///   - pageSize: The page size. Only the aspect ratio is considered, so the units are irrelevant.
    ///   - containerSize: The size of the container that will display the thumbnails in points.
    ///   - interitemSpacing: The padding between thumbnails in points.
    /// - Returns: An appropriate size for thumbnails in points.
    func automaticThumbnailSize(for pageSize: CGSize,
                                containerSize: CGSize,
                                interitemSpacing: CGFloat) -> CGSize {
        // What is the total available area?
        let containerArea = containerSize.width * containerSize.height

        // We decided showing around 10 thumbnails is enough to be useful without being overwhelming.
        let approximateNumberOfThumbnailsToShow: CGFloat = 10

        // Divide the available area by the target number of thumbnails
        // to get the approximate area for each thumbnail.
        let approximateThumbnailArea = containerArea / approximateNumberOfThumbnailsToShow

        // We want to handle pages of any aspect ratio (portrait or landscape).
        let pageAspectRatio = pageSize.width / pageSize.height

        //                   area = width × height
        //           aspect ratio = width / height
        // => area × aspect ratio = width × width
        let approximateThumbnailWidthSquared = approximateThumbnailArea * pageAspectRatio

        // Take the square root of the value calculated above to find the approximate thumbnail width.
        let approximateThumbnailWidth = sqrt(approximateThumbnailWidthSquared)

        // We need a whole number of columns.
        let numberOfColumns = round(containerSize.width / approximateThumbnailWidth)

        // Account for padding between the thumbnails.
        let availableWidth = containerSize.width - interitemSpacing * (numberOfColumns - 1)

        // Divide the available width between the columns.
        let thumbnailWidth = availableWidth / numberOfColumns

        // Finally we have the thumbnail size. Round to a number of points or pixels.
        // We must round down. Otherwise, the thumbnails might not fit.
        return CGSize(width: floor(thumbnailWidth),
                      height: floor(thumbnailWidth / pageAspectRatio))
    }
}
