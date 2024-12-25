import SwiftUI

class SelectCategoryViewModel: ObservableObject {
    let contact = SelectCategoryModel()
    @Published var isMenuAvailible = false
    @Published var selectedButton: Int? = nil

    func goToMenu() {
        isMenuAvailible = true
    }
    
    func selectButton(number: Int) {
        selectedButton = number
    }
}
