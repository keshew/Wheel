import SwiftUI

class RollRecipesViewModel: ObservableObject {
    let contact = RollRecipesModel()
    @Published var currentSide = 1
    @Published var rotationAngle: Double = 0
    @Published var isAnimating = false
    @Published var timer: Timer?
    @Published var stopTimer: Timer?
    @Published var showRecept = false
    @Published var selectedItem: Item = Item(name: "", ingredients: "", recept: "", image: "", detailImage: "")
    func goToMenu() {
        
    }
    
 
    
 
}
