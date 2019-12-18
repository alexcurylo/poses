// @copyright Trollwerks Inc.

import SwiftUI

/// SwiftUI content view
struct ContentView: View, ServiceProvider {

    @State private var selection = 0

    /// View body
    var body: some View {
        // swiftlint:disable:next closure_body_length
        TabView(selection: $selection) {
            Text("First View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text(String(Tab.gallery))
                    }
                }
                .onAppear {
                    //self.report.screen("First View")
                }
                .tag(0)
            Text("Second View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text(String(Tab.categories))
                    }
                }
                .onAppear {
                    //self.report.screen("Second View")
                }
                .tag(1)
            Text("Third View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text(String(Tab.favorites))
                    }
                }
                .onAppear {
                    //self.report.screen("Third View")
                }
                .tag(2)
            Text("Fourth View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text(String(Tab.fitPose))
                    }
                }
                .onAppear {
                    //self.report.screen("Second View")
                }
                .tag(3)
            Text("Fifth View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("second")
                        Text(String(Tab.extras))
                    }
                }
                .onAppear {
                    //self.report.screen("Second View")
                }
                .tag(4)
        }
    }
}

/// SwiftUI content view previews
struct ContentView_Previews: PreviewProvider {

    /// SwiftUI content view previews
    static var previews: some View {
        ContentView()
    }
}
