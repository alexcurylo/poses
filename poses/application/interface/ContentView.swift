// @copyright Trollwerks Inc.

import SwiftUI

/// SwiftUI content view
struct ContentView: View, ServiceProvider {

    @State private var selection = 0

    /// View body
    var body: some View {
        TabView(selection: $selection) {
            Text("First View")
                .font(.title)
                .tabItem {
                    VStack {
                        Image("first")
                        Text(L.tabFirst())
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
                        Text(L.tabSecond())
                    }
                }
                .onAppear {
                    //self.report.screen("Second View")
                }
                .tag(1)
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
