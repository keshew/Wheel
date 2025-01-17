import SwiftUI

class RecipeViewModel: ObservableObject {
    let contact = RecipeModel()
    @Published var isDetailAvailible = false
    @Published var recept = Item(name: "", ingredients: "", recept: "", image: "", detailImage: "", isRecipeOfMounth: false)
    
    func goToDetail(with: Item) {
        recept = with
        isDetailAvailible = true
    }
}
