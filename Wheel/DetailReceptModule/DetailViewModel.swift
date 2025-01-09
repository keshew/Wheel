import SwiftUI

class DetailViewModel: ObservableObject {
    let contact = DetailModel()
    @Published var isMenuAvailible = false
    @Published var isAddedToFav = false
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func toggleFav() {
        isAddedToFav.toggle()
    }
    
    func addToFav() -> String {
        var image = ImageName.addToFav.rawValue
        if isAddedToFav == false {
            image = ImageName.addToFav.rawValue
        } else {
            image = ImageName.addedToFav.rawValue
        }
        return image
    }
}
