// @copyright Trollwerks Inc.

import AVFoundation
import SFSafeSymbols
import SwiftUI

struct FlashButton: View {

    /// Binding to owner's flash state
    @Binding var flash: AVCaptureDevice.FlashMode

    /// :nodoc:
    var body: some View {
        Button(action: cycle) {
            HStack {
                Image(systemSymbol: image)
                Text(text)
            }
        }
    }
}

private extension FlashButton {

    func cycle() {
        switch flash {
        case .off:
            flash = .on
        case .on:
            flash = .auto
        case .auto:
            flash = .off
        @unknown default:
            flash = .off
        }
    }

    var image: SFSymbol {
        switch flash {
        case .off:
            return .boltSlash
        case .on:
            return .boltFill
        case .auto:
            return .bolt
        @unknown default:
            return .bolt
        }
    }

    var text: String {
        switch flash {
        case .off:
            return L.off()
        case .on:
            return L.on()
        case .auto:
            return L.auto()
        @unknown default:
            return L.auto()
        }
    }
}

/// :nodoc:
struct FlashButton_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        PreviewWrapper()
    }

    /// :nodoc:
    struct PreviewWrapper: View {

        @State(initialValue: .off) var flash: AVCaptureDevice.FlashMode

        var body: some View {
            FlashButton(flash: $flash)
        }
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
