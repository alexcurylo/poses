// @copyright Trollwerks Inc.

import SwiftUI

struct CountdownButton: View {

    /// Binding to owner's countdown state
    @Binding var countdown: Int

    private let values = [ 0, 3, 10 ]

    /// :nodoc:
    var body: some View {
        Button(action: cycle) {
            HStack {
                Image(systemSymbol: .timer)
                if countdown > 0 {
                    Text(String(countdown))
                }
            }
        }
    }
}

private extension CountdownButton {

    func cycle() {
        switch countdown {
        case ...values[0]:
            countdown = values[1]
        case ...values[1]:
            countdown = values[2]
        default:
            countdown = values[0]
        }
    }
}

/// :nodoc:
struct CountdownButton_Previews: PreviewProvider {

    @State private var countdown = 0

    /// :nodoc:
    static var previews: some View {
        PreviewWrapper()
    }

    /// :nodoc:
    struct PreviewWrapper: View {

        @State(initialValue: 0) var countdown: Int

        var body: some View {
            CountdownButton(countdown: $countdown)
        }
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}
