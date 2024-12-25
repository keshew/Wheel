import SwiftUI

class ProfileViewModel: ObservableObject {
    let contact = ProfileModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
