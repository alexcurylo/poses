// @copyright Trollwerks Inc.

import AVFoundation

extension AVCaptureDevice.Position {

    /// Opposite of a device position if sensible
    func opposite() -> Self {
        switch self {
        case .front: return .back
        case .back: return .front
        case .unspecified: return self
        @unknown default: return self
        }
    }
}

extension AVCaptureDevice {

    /// Returns  camera at position if available
    /// - Parameter position: Position to check
    class func camera(at position: Position) -> AVCaptureDevice? {
        let types: [AVCaptureDevice.DeviceType] = [
            .builtInWideAngleCamera,
        ]
        let discover = DiscoverySession(
            deviceTypes: types,
            mediaType: .video,
            position: position
        )
        return discover.devices.first
    }

    /// Remove any focusing that may have been applied
    func removeFocus() {
        let interestPoint = isFocusPointOfInterestSupported ? focusPointOfInterest
                                                            : exposurePointOfInterest
        let center = CGPoint(x: 0.5, y: 0.5)
        if !interestPoint.equalTo(center) {
            change(interest: center)
        }
    }
}

private extension AVCaptureDevice {

    func change(interest point: CGPoint) {
        configure {
            if isFocusPointOfInterestSupported {
                focusPointOfInterest = point
                focusMode = .continuousAutoFocus
            }
            if isExposurePointOfInterestSupported {
                exposurePointOfInterest = point
                exposureMode = .continuousAutoExposure
            }
        }
    }

    func configure(configuration: () -> Void) {
        do {
            try lockForConfiguration()
            configuration()
            unlockForConfiguration()
        } catch {
            ConsoleLoggingService().error("AVCaptureDevice configuration: \(error)")
        }
    }
}
