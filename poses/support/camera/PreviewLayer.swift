// @copyright Trollwerks Inc.

import AVFoundation

/// An  orientation-aware AVCaptureVideoPreviewLayer
final class PreviewLayer: AVCaptureVideoPreviewLayer {

    /// name for locating layer
    static let name = String(describing: PreviewLayer.self)

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
}
