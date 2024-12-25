import SwiftUI

enum AppScreen {
    case home
    case settings
    case profile
    case addCategory
    case addRecept
    case wheel
    case select
    case spin
}

class LoadingViewModel: ObservableObject {
    let contact = LoadingModel()
    @Published var currentIndex = 0
    @Published var timer: Timer?
    @Published var currentText = "LOADING..."
    @Published var index = 2
    
    func loadScreen() -> (String, CGFloat, CGFloat) {
        return (contact.arrayOfImages[currentIndex], contact.arrayXOffset[currentIndex], contact.arraySize[currentIndex])
    }
    
    func startTimer() {
         timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
             self.changeText()
         }
     }
    
    func changeText() {
        index -= 1
        if index == -1 {
            index = 2
        }
        currentText = contact.arrayOfText[index]
     }
}
