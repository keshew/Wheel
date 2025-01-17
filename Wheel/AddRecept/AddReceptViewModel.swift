import SwiftUI
import PhotosUI

class AddReceptViewModel: ObservableObject {
    let contact = AddReceptModel()
    @Published var isMenuAvailible = false
    @Published var text = "Write recipe here..."
    @Published var text2 = "Write ingridients here..."
    @Published var text3 = "Name category here..."
    @Published var selectedItem: PhotosPickerItem? = nil
    @Published var selectedImage: Image? = nil
    @Published var imageString = ""
    
    func goToMenu() {
        isMenuAvailible = true
    }
}
