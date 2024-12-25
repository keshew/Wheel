import SwiftUI

class SpinWheelViewModel: ObservableObject {
    let contact = SpinWheelModel()
    @Published var isRecept = false

    func goToRecept() {
        isRecept = true
    }
}
