import SwiftUI

class SelectRecipesViewModel: ObservableObject {
    let contact = SelectRecipesModel()
    @Published var buttonStates: [[Bool]] = Array(repeating: Array(repeating: false, count: 7), count: 3)
    @Published var selectedRecipes: [Item] = []
    @Published var isRollAvailible = false
    func goToRoll() {
        isRollAvailible = true
    }
}
