import SwiftUI

extension Text {
    func Ponytail(size: CGFloat, color: Color = .white, outlineWidth: CGFloat = 0.5, colorOutline: Color = .black) -> some View {
        self.font(.custom("Ponytail", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
    
    func Rubik(size: CGFloat, color: Color = .white, outlineWidth: CGFloat = 0.5, colorOutline: Color = .black) -> some View {
        self.font(.custom("Rubik", size: size))
            .foregroundColor(color)
            .outlineText(color: colorOutline, width: outlineWidth)
    }
}

