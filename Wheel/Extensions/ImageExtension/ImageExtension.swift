import SwiftUI

extension Image {
    init(name: ImageName) {
        self.init(name.rawValue)
    }
}
