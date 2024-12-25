import SwiftUI

@main
struct WheelApp: App {
    var body: some Scene {
        WindowGroup {
            LoadingView()
                .onAppear {
                    UserDefaultsManager().firstLaunch()
                }
        }
    }
}
