import SwiftUI

class DetailViewModel: ObservableObject {
    let contact = DetailModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
