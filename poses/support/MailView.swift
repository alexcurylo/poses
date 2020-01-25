// @copyright Trollwerks Inc.

#if canImport(MessageUI)
import MessageUI
import SwiftUI

// https://stackoverflow.com/questions/56784722/swiftui-send-email

/// SwiftUI wrapper for MFMailComposeViewController
struct MailView: UIViewControllerRepresentable, ServiceProvider {

    /// Provided to created Coordinator
    @Environment(\.presentationMode) var presentation
    /// Bound to containing State
    @Binding var result: Result<MFMailComposeResult, Error>?

    /// UIViewControllerRepresentable associated type
    final class Coordinator: NSObject, MFMailComposeViewControllerDelegate {

        @Binding private var presentation: PresentationMode
        @Binding private var result: Result<MFMailComposeResult, Error>?

        /// :nodoc:
        init(presentation: Binding<PresentationMode>,
             result: Binding<Result<MFMailComposeResult, Error>?>) {
            _presentation = presentation
            _result = result
        }

        /// :nodoc:
        func mailComposeController(
            _ controller: MFMailComposeViewController,
            didFinishWith result: MFMailComposeResult,
            error: Error?
        ) {
            defer {
                $presentation.wrappedValue.dismiss()
            }
            if let error = error {
                self.result = .failure(error)
            } else {
                self.result = .success(result)
            }
        }
    }

    /// :nodoc:
    func makeCoordinator() -> Coordinator {
        Coordinator(presentation: presentation,
                    result: $result)
    }

    /// :nodoc:
    func makeUIViewController(
        context: UIViewControllerRepresentableContext<MailView>
    ) -> MFMailComposeViewController {
        let vc = MFMailComposeViewController()
        vc.mailComposeDelegate = context.coordinator
        vc.setToRecipients([L.mailAddress()])
        vc.setSubject(L.mailSubject(app.version))
        return vc
    }

    /// :nodoc:
    func updateUIViewController(
        _ uiViewController: MFMailComposeViewController,
        context: UIViewControllerRepresentableContext<MailView>
    ) {
    }
}
#endif
