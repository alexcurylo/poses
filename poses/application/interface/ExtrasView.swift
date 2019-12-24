// @copyright Trollwerks Inc.

import SwiftUI

// swiftlint:disable closure_body_length

/// SwiftUI extras tab
struct ExtrasView: View, ServiceProvider {

    @State private var subscribed = false
    @State private var upgrades: [String] = []
    @State private var packs: [String] = [
        "female001paid",
        "female002paid",
        "female003paid"
    ]

    /// :nodoc:
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text(L.subscription())) {
                    if subscribed {
                        Text(L.subscribed())
                    } else {
                        Text(L.subscribe())
                    }
                }
                Section(header: Text(L.upgrades())) {
                    if upgrades.isEmpty {
                        Text(L.noUpgrades())
                    } else {
                        ForEach(0..<upgrades.count) {
                            Text(self.upgrades[$0])
                        }
                    }
                }
                Section(header: Text(L.packs())) {
                    if packs.isEmpty {
                        Text(L.noPacks())
                    } else {
                        ForEach(0..<packs.count) {
                            Text(self.packs[$0])
                        }
                    }
                }
                Section(header: Text(L.support())) {
                    Button(action: {
                        self.report.event(.sendFeedback)
                    }, label: {
                        Text(L.feedback())
                    })
                    Button(action: {
                        self.report.event(.postReview)
                    }, label: {
                        Text(L.review())
                    })
                    Button(action: {
                        self.report.event(.restorePurchases)
                    }, label: {
                        Text(L.restore())
                    })
                    Button(action: {
                        self.report.event(.showReleaseNotes)
                    }, label: {
                        Text(L.notes())
                    })
                    Button(action: {
                        self.report.event(.visitPhotographyTips)
                    }, label: {
                        Text(L.visit())
                    })
                }
            }
            .navigationBarTitle(String(Tab.extras))
        }
        .onAppear {
            self.report.screen(String(Tab.extras))
        }
    }
}
