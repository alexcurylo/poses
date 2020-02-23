// @copyright Trollwerks Inc.

import AVFoundation

extension AVCaptureSession {

    /// Creates AVCaptureSession with photo presets
    /// - Parameter position: Camera position
    class func photoSession(
        position: AVCaptureDevice.Position = .unspecified
    ) throws -> AVCaptureSession {
        let session = AVCaptureSession()
        session.sessionPreset = .photo
        try session.add(camera: position)
        try session.addPhotoOutput()
        session.startRunning()
        return session
    }

    /// Switch back and front cameras
    func switchCamera() {
        var position = AVCaptureDevice.Position.unspecified
        if let input = inputs.first as? AVCaptureDeviceInput {
            position = input.device.position
            removeInput(input)
        }
        try? add(camera: position.opposite())
    }
}

private extension AVCaptureSession {

    func add(camera position: AVCaptureDevice.Position) throws {
        let camera = try unwrap(AVCaptureDevice.camera(at: position))
        let cameraInput = try AVCaptureDeviceInput(device: camera)
        if canAddInput(cameraInput) {
            addInput(cameraInput)
        } else {
            throw "add camera \(position.rawValue) failed"
        }
    }

    func addPhotoOutput() throws {
        let photo = AVCapturePhotoOutput()
        if canAddOutput(photo) {
            addOutput(photo)
        } else {
           throw "addPhotoOutput failed"
       }
    }
}
