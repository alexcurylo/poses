// @copyright Trollwerks Inc.

import AVFoundation

extension UIView {

    /// Camera preview layer if present
    var previewLayer: PreviewLayer? {
        layer.sublayer(named: PreviewLayer.name) as? PreviewLayer
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

        addGestureRecognizer(CameraPincher(target: self,
                                           action: #selector(pinchZoom)))
        addGestureRecognizer(CameraTapper(target: self,
                                          action: #selector(tapFocus)))
        device?.change(monitoring: true)

        NotificationCenter.default.addObserver(
            self,
            selector: #selector(removeFocus),
            name: .AVCaptureDeviceSubjectAreaDidChange,
            object: nil)
    }

    /// Switch back and front cameras
    func switchCamera() throws {
        removeFocus()
        try unwrap(previewLayer?.session).switchCamera()
    }

    /// Remove camera preview layer
    func removePreview() {
        gestureRecognizerOfType(CameraPincher.self)?.removeFromView()
        gestureRecognizerOfType(CameraTapper.self)?.removeFromView()

        focusLayer?.removeFromSuperlayer()

        NotificationCenter.default.removeObserver(
            self,
            name: NSNotification.Name.AVCaptureDeviceSubjectAreaDidChange,
            object: nil)

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
    ///   - flash: Flash mode for settings
    ///   - then: Action when capture complete
    func capture(
        photo flash: AVCaptureDevice.FlashMode,
        then: @escaping ((Result<UIImage, Error>) -> Void)
    ) {
        guard let previewLayer = previewLayer else { return }

        alpha = 0
        UIView.animate(withDuration: 1) { self.alpha = 1 }

        previewLayer.connection?.isEnabled = false
        previewLayer.capture(photo: flash) { result in
            previewLayer.session?.stopRunning()
            then(result)
        }
    }

    /// Show focus image
    /// - Parameter focus: Center
    @objc func show(focus: CGPoint) {
        focusLayer?.removeFromSuperlayer()
        let focusLayer = FocusLayer(center: focus)
        previewLayer?.addSublayer(focusLayer)
    }

    /// Remove focus image and function
    @objc func removeFocus() {
        focusLayer?.removeFromSuperlayer()
        device?.removeFocus()
    }

    /// Handle pinch to Zoom
    /// - Parameter sender: Recognizer
    @objc func pinchZoom(_ sender: UIPinchGestureRecognizer) {
        enum Zoom {
            static var initial: CGFloat = 1
        }

        if let device = device {
            if sender.state == .began {
                Zoom.initial = device.videoZoomFactor
            }
            device.change(zoom: sender.scale * Zoom.initial)
        }
    }

    /// Handle tap to focus
    /// - Parameter sender: Recognizer
    @objc func tapFocus(_ sender: UITapGestureRecognizer) {
        let focus = sender.location(in: self)

        if let device = device {
            if !device.isFocusPointOfInterestSupported && !device.isExposurePointOfInterestSupported {
                return
            }

            let local = CGPoint(
                x: (focus.y - bounds.minY) / bounds.height,
                y: 1 - (focus.x - bounds.minX) / bounds.width)
            device.change(interest: local)
            show(focus: focus)
        } else if UIApplication.isSimulator {
            show(focus: focus)
        }
    }
}

extension UIColor {

    /// Color for preview images and controls
    class var previewYellow: UIColor {
        UIColor(red: 1, green: 0.8, blue: 0.2, alpha: 1)
    }
}

private extension UIView {

    var device: AVCaptureDevice? {
        (previewLayer?.session?.inputs.first as? AVCaptureDeviceInput)?.device
    }
}
