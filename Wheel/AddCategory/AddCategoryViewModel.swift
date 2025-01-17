import SwiftUI
import PhotosUI

class AddCategoryViewModel: ObservableObject {
    let contact = AddCategoryModel()
    @Published var isMenuAvailible = false
    @Published var text = "Name category here..."
    @Published var selectedItem: PhotosPickerItem? = nil
    @Published var selectedImage: Image? = nil
    @Published var imageString = ""
    func goToMenu() {
        isMenuAvailible = true
    }
}
