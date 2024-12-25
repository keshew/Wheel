import SwiftUI

class RecipeViewModel: ObservableObject {
    let contact = RecipeModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
