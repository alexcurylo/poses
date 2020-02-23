// @copyright Trollwerks Inc.

import AVFoundation

extension AVCaptureSession {

    class func photoSession(
        position: AVCaptureDevice.Position = .unspecified
    ) throws -> AVCaptureSession {
        #if targetEnvironment(simulator)
            throw "no camera in Simulator"
        #else
            let session = AVCaptureSession()
            session.sessionPreset = .photo
            session.startRunning()
            return session
        #endif
    }
}
