// @copyright Trollwerks Inc.

import AVFoundation

extension UIView {

    /// Add camera preview layer
    func showPreview() throws {
        let session = try AVCaptureSession.photoSession()
        let previewLayer = PreviewLayer(session: session)
        layer.insert(background: previewLayer,
                     name: PreviewLayer.name)
    }

    /// Remove camera preview layer
    func removePreview() {
        previewLayer?.removeFromSuperlayer()
    }

    /// Camera preview layer if present
    var previewLayer: AVCaptureVideoPreviewLayer? {
        layer.sublayer(named: PreviewLayer.name) as? AVCaptureVideoPreviewLayer
    }
}
