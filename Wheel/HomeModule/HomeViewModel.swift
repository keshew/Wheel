import SwiftUI

class HomeViewModel: ObservableObject {
    let contact = HomeModel()
    @Published var isMenuAvailible = false
    @Published var isDetailAvailible = false
    @Published var isWaitAvailible = false
    @Published var recept = Item(name: "", ingredients: "", recept: "", image: "", detailImage: "", isRecipeOfMounth: false)
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToDetail(with: Item) {
        recept = with
        isDetailAvailible = true
    }
    

}
