import SwiftUI

class AddCategoryViewModel: ObservableObject {
    let contact = AddCategoryModel()
    @Published var isMenuAvailible = false

    func goToMenu() {
        isMenuAvailible = true
    }
}
