import SwiftUI

class FavoriteViewModel: ObservableObject {
    let contact = FavoriteModel()
    @Published var isDetailAvailible = false
    @Published var recept = Item(name: "", ingredients: "", recept: "", image: "", detailImage: "", isRecipeOfMounth: false)
    
    func goToDetail(with: Item) {
        recept = with
        isDetailAvailible = true
    }
    
    func goTo() {
        
    }
}
