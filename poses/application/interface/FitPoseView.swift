// @copyright Trollwerks Inc.

#if canImport(Introspect)
import Introspect
#endif
import SwiftUI

/// SwiftUI fit pose tab
struct FitPoseView: View, ServiceProvider {

    @State private var viewfinder: UIView?
    @State private var isShowingControls = false
    @State private var isMarchingAnts = false

    /// :nodoc:
    var body: some View {
        ZStack { // swiftlint:disable:this closure_body_length
            Color.white.introspectColor(customize: found(view:))
            VStack { // swiftlint:disable:this closure_body_length
                Text(L.instructions())
                .font(.subheadline)
                .italic()
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()
                Rectangle() // Image placeholder
                .stroke(Color.gray,
                        style: StrokeStyle(lineWidth: 2,
                                           lineCap: .butt,
                                           lineJoin: .round,
                                           dash: [10, 10],
                                           dashPhase: isMarchingAnts ? 0 : 40))
                .padding()
                .animation(Animation.linear(duration: 1)
                                    .repeatForever(autoreverses: false)
                                    .speed(2))
                Button(action: start) {
                    Text(L.start())
                        .font(.headline)
                        .padding()
                }
            }
        }
        .onAppear(perform: appear)
        .animation(.default)
    }
}

private extension FitPoseView {

    func appear() {
        report.screen(String(Tab.fitPose))
        isMarchingAnts.toggle()
    }

    func found(view: UIView) {
        viewfinder = view
    }

    func start() {
        isShowingControls = true
    }
}

/// :nodoc:
struct FitPoseView_Previews: PreviewProvider {

    /// :nodoc:
    static var previews: some View {
        FitPoseView()
    }

    /// :nodoc:
    static var platform: PreviewPlatform? { .iOS }
}

private extension View {

    func introspectColor(customize: @escaping (UIView) -> Void) -> some View {
        inject(IntrospectionView(
            selector: {
                Introspect.findViewHost(from: $0)?.superview?.subviews.first
            },
            customize: customize
        ))
    }
}
