// @copyright Trollwerks Inc.

#if canImport(Introspect)
import Introspect
#endif
import SwiftUI

/// SwiftUI fit pose tab
struct FitPoseView: View, ServiceProvider {

    @State private var preview: UIView?
    @State private var isAnimating = false
    @State private var isPreviewing = false
    @State private var isShowingError = false

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
                        style: antsStroke)
                .padding()
                .animation(antsAnimation)
                if isPreviewing {
                    Button(action: capturePhoto) {
                        Circle()
                        .fill(Color.white)
                        .frame(width: 80, height: 80)
                        .overlay(
                            Circle().stroke(Color.black,
                                            lineWidth: 3)
                                    .frame(width: 60, height: 60)
                        )
                        .padding()
                    }
                } else {
                    Button(action: toggle) {
                        Text(L.start())
                        .font(.headline)
                        .padding()
                    }
                }
            }
        }
        .onAppear(perform: appear)
        .onDisappear(perform: disappear)
        .animation(.default)
        .alert(isPresented: $isShowingError) {
            Alert(title: Text(L.error()),
                  message: Text(L.noCamera()),
                  dismissButton: .default(Text(L.ok())))
        }
    }
}

private extension FitPoseView {

    var antsStroke: StrokeStyle {
        isPreviewing ? StrokeStyle(lineWidth: 0,
                                   lineCap: .butt,
                                   lineJoin: .round,
                                   dash: [10, 10],
                                   dashPhase: 0)
                     : StrokeStyle(lineWidth: 2,
                                   lineCap: .butt,
                                   lineJoin: .round,
                                   dash: [10, 10],
                                   dashPhase: isAnimating ? 0 : 40)
    }

    var antsAnimation: Animation? {
        isPreviewing ? nil
                     : Animation.linear(duration: 1)
                                .repeatForever(autoreverses: false)
                                .speed(2)
    }

    func appear() {
        report.screen(String(Tab.fitPose))
        isAnimating.toggle()
    }

    func disappear() {
        hidePreview()
        isAnimating = false
    }

    func found(view: UIView) {
        preview = view
    }

    func toggle() {
        isPreviewing ? stop() : start()
    }

    func start() {
        do {
            try preview?.showPreview()
            showControls()
        } catch {
            if UIApplication.isSimulator {
                return showControls()
            }
            log.error("start camera: \(error)")
            isShowingError = true
        }
    }

    func showControls() {
        isPreviewing = true
        isAnimating = false
    }

    func stop() {
        hidePreview()
        isAnimating.toggle()
    }

    func hidePreview() {
        if isPreviewing {
            preview?.removePreview()
            isPreviewing = false
        }
    }

    func capturePhoto() {
        // TO DO: countdown state here

        preview?.capturePhoto { camera, capturedImage, error in
            camera.restartPreview()
            // TO DO: handle capturedImage and error
            _ = (capturedImage, error)
        }
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
        inject(UIKitIntrospectionView(
            selector: {
                Introspect.findViewHost(from: $0)?.superview?.subviews.first
            },
            customize: customize
        ))
    }
}
