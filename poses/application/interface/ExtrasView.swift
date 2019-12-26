// @copyright Trollwerks Inc.

#if canImport(MessageUI)
import MessageUI
#endif
import SwiftUI

// swiftlint:disable closure_body_length

/// SwiftUI extras tab
struct ExtrasView: View, ServiceProvider {

    @State private var subscribed: Bool
    @State private var upgrades: [String]
    @State private var packs: [String]

    #if canImport(MessageUI)
    @State private var mailed: Result<MFMailComposeResult, Error>?
    @State private var isShowingMailView = false
    #endif

    /// :nodoc:
    init() {
        if Services().data.isSubscribed {
            _subscribed = State(initialValue: true)
            _upgrades = State(initialValue: [])
            _packs = State(initialValue: [])
        } else {
            _subscribed = State(initialValue: false)
            _upgrades = State(initialValue: [ "female001free" ])
            _packs = State(initialValue: ["female001paid"])
        }
    }

    /// :nodoc:
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(L.subscription())) {
                    if subscribed {
                        Text(L.subscribed())
                    } else {
                        Button(action: {
                            self.report.event(.subscribe)
                        }, label: {
                            Text(L.subscribe())
                        })
                        .accessibility(identifier: UIExtras.subscribe.identifier)
                    }
                }
                Section(header: Text(L.upgrades())) {
                    if upgrades.isEmpty {
                        Text(L.noUpgrades())
                    } else {
                        ForEach(upgrades, id: \.self) { pack in
                            Button(action: {
                                self.report.event(.upgrade(pack: pack))
                            }, label: {
                                Text(pack)
                            })
                            .accessibility(identifier: UIExtras.upgrade(pack: pack).identifier)
                        }
                    }
                }
                Section(header: Text(L.packs())) {
                    if packs.isEmpty {
                        Text(L.noPacks())
                    } else {
                        ForEach(packs, id: \.self) { pack in
                            Button(action: {
                                self.report.event(.purchase(pack: pack))
                            }, label: {
                                Text(pack)
                            })
                            .accessibility(identifier: UIExtras.purchase(pack: pack).identifier)
                        }
                    }
                }
                Section(header: Text(L.support())) {
                    #if canImport(MessageUI)
                    Button(action: {
                        self.sendFeedback()
                    }, label: {
                        Text(L.feedback())
                    })
                    .accessibility(identifier: UIExtras.feedback.identifier)
                    .disabled(!MFMailComposeViewController.canSendMail())
                    .sheet(isPresented: $isShowingMailView) {
                        MailView(result: self.$mailed)
                    }
                    #endif
                    Button(action: {
                        self.postReview()
                    }, label: {
                        Text(L.review())
                    })
                    .accessibility(identifier: UIExtras.review.identifier)
                    Button(action: {
                        self.report.event(.restorePurchases)
                    }, label: {
                        Text(L.restore())
                    })
                    .accessibility(identifier: UIExtras.restore.identifier)
                    Button(action: {
                        self.report.event(.showReleaseNotes)
                    }, label: {
                        Text(L.notes())
                    })
                    .accessibility(identifier: UIExtras.notes.identifier)
                    #if os(iOS)
                    Button(action: {
                        self.visitPhotographyTips()
                    }, label: {
                        Text(L.visit())
                    })
                    .accessibility(identifier: UIExtras.visit.identifier)
                    #endif
                }
            }
            .navigationBarTitle(String(Tab.extras))
        }
        .onAppear {
            self.report.screen(String(Tab.extras))
        }
    }

    #if canImport(MessageUI)
    /// Send Feedback action
    func sendFeedback() {
        report.event(.sendFeedback)
        isShowingMailView.toggle()
    }
    #endif

    /// Post Review action
    func postReview() {
        if let url = URL(string: L.appStore()),
           var components = URLComponents(url: url,
                                          resolvingAgainstBaseURL: false) {
            components.queryItems = [ URLQueryItem(name: "action", value: "write-review") ]
            if let writeReviewURL = components.url {
                report.event(.postReview)

                app.launch(url: writeReviewURL)
            }
        }
    }

    /// Visit Photography Tips action
    func visitPhotographyTips() {
        if let url = URL(string: L.photographyTips()) {
            report.event(.visitPhotographyTips)
            app.launch(url: url)
        }
    }
}
