// @copyright Trollwerks Inc.

import AVFoundation

extension AVCaptureVideoPreviewLayer {

    func capturePhoto(
        then: @escaping (UIImage?, NSError?) -> Void
    ) {
        let errorCompletion = { (code: Int, description: String) -> Void in
            then(nil,
                 NSError(domain: "AVCaptureError",
                         code: code,
                         userInfo: [NSLocalizedDescriptionKey: description]))
            return
        }

        if let photoOutput = photoOutput {
            let settings = AVCapturePhotoSettings()
            // TO DO: set flash here, figure out why throws exception
            photoOutput.capturePhoto(with: settings,
                                     delegate: self)
        } else {
            errorCompletion(3, "Can't find AVCaptureStillImageOutput")
        }
    }
}

private extension AVCaptureVideoPreviewLayer {

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

// TO DO: Handle results
extension AVCaptureVideoPreviewLayer: AVCapturePhotoCaptureDelegate {}
