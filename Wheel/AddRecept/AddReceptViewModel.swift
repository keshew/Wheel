import SwiftUI

class AddReceptViewModel: ObservableObject {
    let contact = AddReceptModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
