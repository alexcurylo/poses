// @copyright Trollwerks Inc.

import AVFoundation

/// An  orientation-aware AVCaptureVideoPreviewLayer
final class PreviewLayer: AVCaptureVideoPreviewLayer {

    /// name for locating layer
    static let name = String(describing: PreviewLayer.self)

    /// Capture completion type
    typealias Completion = (Result<UIImage, Error>) -> Void

    private var then: Completion?

    /// :nodoc:
    override init(session: AVCaptureSession) {
        super.init(session: session)

        setup()
    }

    /// :nodoc:
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        setup()
    }

    /// :nodoc:
    override init(layer: Any) {
        super.init(layer: layer)

        setup()
    }

    /// Capture photo from preview layer
    /// - Parameters:
    ///   - flash: Flash mode for settings
    ///   - then: Action when capture complete
    func capture(
        photo flash: AVCaptureDevice.FlashMode,
        then: @escaping Completion
    ) {
        guard let photoOutput = photoOutput else {
            return then(.failure("missing photoOutput"))
        }

        self.then = then
        let settings = AVCapturePhotoSettings()
        settings.flashMode = flash
        photoOutput.capturePhoto(with: settings,
                                 delegate: self)
     }
}

private extension PreviewLayer {

    func setup() {
        observe(
            notification: UIDevice.orientationDidChangeNotification,
            selector: #selector(updateOrientation)
        )
        videoGravity = .resizeAspectFill
    }

    @objc func updateOrientation() {
        guard let superlayer = superlayer else { return }

        frame = superlayer.bounds
        guard
            let connection = connection,
            connection.isVideoOrientationSupported,
            let captureOrientation = UIApplication.captureOrientation()
        else {
            return
        }

        connection.videoOrientation = captureOrientation
    }

    var photoOutput: AVCapturePhotoOutput? {
        if let session = session {
            for videoOutput in session.outputs {
                if let imageOutput = videoOutput as? AVCapturePhotoOutput {
                    return imageOutput
                }
            }
        }
        return nil
    }
}

extension PreviewLayer: AVCapturePhotoCaptureDelegate {

    public func photoOutput(
        _ output: AVCapturePhotoOutput,
        didFinishProcessingPhoto photo: AVCapturePhoto,
        error: Error?
    ) {
        if let error = error {
            then?(.failure(error))
        } else if let data = photo.fileDataRepresentation(),
            let provider = CGDataProvider(data: data as CFData),
            let cgImage = CGImage(jpegDataProviderSource: provider,
                                  decode: nil,
                                  shouldInterpolate: true,
                                  intent: .defaultIntent) {
            let image = UIImage(cgImage: cgImage)
            then?(.success(image))
        } else {
            then?(.failure("failed to create UIImage"))
        }

        then = nil
    }
}
