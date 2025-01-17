import SwiftUI

class ProfileViewModel: ObservableObject {
    let contact = ProfileModel()
    @Published var isMenuAvailible = false
    @Published var recept = Item(name: "", ingredients: "", recept: "", image: "", detailImage: "", isRecipeOfMounth: false)
    @Published var isDetailAvailible = false
    
    func goToMenu() {
        isMenuAvailible = true
    }
    
    func goToDetail(with: Item) {
        recept = with
        isDetailAvailible = true
    }
    
    func convertBase64ToImage(base64String: String) -> Image? {
        guard let data = Data(base64Encoded: base64String) else {
            return nil
        }
        
        guard let uiImage = UIImage(data: data) else {
            return nil
        }
        
        return Image(uiImage: uiImage)
    }
}
