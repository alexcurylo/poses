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
}
