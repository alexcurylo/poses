// @copyright Trollwerks Inc.

import AVFoundation

extension UIView {

    /// Camera preview layer if present
    var previewLayer: AVCaptureVideoPreviewLayer? {
        layer.sublayer(named: PreviewLayer.name) as? AVCaptureVideoPreviewLayer
    }

    /// Camera focus layer if present
    var focusLayer: CAShapeLayer? {
        previewLayer?.sublayer(named: FocusLayer.name) as? CAShapeLayer
    }

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

    /// Restart camera preview layer
    func restartPreview() {
        previewLayer?.connection?.isEnabled = true
        previewLayer?.session?.startRunning()
        removeFocus()
    }

    /// Capture photo from preview layer
    /// - Parameters:
    ///   - then: Action when capture complete
    func capturePhoto(
        then: @escaping ((UIView, UIImage?, NSError?) -> Void)
    ) {
        guard let previewLayer = previewLayer else { return }

        alpha = 0
        UIView.animate(withDuration: 1) { self.alpha = 1 }

        previewLayer.connection?.isEnabled = false
        previewLayer.capturePhoto { capturedImage, error in
            previewLayer.session?.stopRunning()
            then(self, capturedImage, error)
        }
    }

    /// Remove focus image and function
    @objc func removeFocus() {
        focusLayer?.removeFromSuperlayer()
        device?.removeFocus()
    }
}

private extension UIView {

    var device: AVCaptureDevice? {
        (previewLayer?.session?.inputs.first as? AVCaptureDeviceInput)?.device
    }
}
