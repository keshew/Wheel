import SwiftUI

class HomeViewModel: ObservableObject {
    let contact = HomeModel()
    @Published var isMenuAvailible = false
    @Published var isDetailAvailible = false
    @Published var recept = Item(name: "", ingredients: "", recept: "", image: "", detailImage: "")
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToDetail(with: Item) {
        recept = with
        isDetailAvailible = true
    }
    

}
