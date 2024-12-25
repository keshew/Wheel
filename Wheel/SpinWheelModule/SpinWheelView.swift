import SwiftUI

struct SpinWheelView: View {
    @StateObject var spinWheelModel =  SpinWheelViewModel()
    @State private var rotation: Double = 0
    @Binding var navigationPath: NavigationPath
    @State private var selectedItem: Item = Item(name: "", ingredients: "", recept: "", image: "", detailImage: "")
    @State var showRecept = false
    
    private func generateRandomValues() -> [Item] {
        var arrayString: [Item] = []
        let nestedArray = UserDefaultsManager().loadAllRecept()
        let firstArray = nestedArray.first
        arrayString = (0..<16).compactMap { index in
            firstArray!.randomElement()
         }
        return arrayString
     }
    
    func spinWheel() {
        let randomSpin = Double.random(in: 720...1440)
        rotation += randomSpin
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let finalRotation = rotation.truncatingRemainder(dividingBy: 360)
            let segmentAngle = 360.0 / Double(generateRandomValues().count)
            let index = Int((finalRotation + (segmentAngle / 2)) / segmentAngle) % generateRandomValues().count
            
            selectedItem = generateRandomValues()[(generateRandomValues().count - index) % generateRandomValues().count]
            
            showRecept = true
        }
    }
    
    var body: some View {
        GeometryReader { geomtry in
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                Image(.shadowBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                if showRecept {
                   RecipeView(recept: $selectedItem, navigationPath: $navigationPath)
                        .frame(maxWidth: geomtry.size.width, maxHeight: geomtry.size.height)
                        .zIndex(1)
                }
                
                VStack {
                    Image(.wheelLabel)
                        .resizable()
                        .frame(width: 353, height: 120)
                        .offset(y: geomtry.size.height / 35)
                    
                    ZStack {
                        Image(.wheel)
                            .resizable()
                            .frame(width: 361, height: 361)
                            .rotationEffect(.degrees(rotation))
                            .animation(.easeOut(duration: 2), value: rotation)
                        
                        Image(.wheelPin)
                            .resizable()
                            .frame(width: 53, height: 64)
                            .offset(y: -geomtry.size.height / 6)
                        
                        ForEach(0..<generateRandomValues().count, id: \.self) { index in
                            let angle = (Double(index) * (360.0 / Double(generateRandomValues().count))) - 90
                            let x = cos(angle * .pi / 180) * geomtry.size.width / 4.5
                            let y = sin(angle * .pi / 180) * geomtry.size.height / 9.5
                            
                            Text(generateRandomValues()[index].name)
                                .Rubik(size: 6, outlineWidth: 0.0)
                                .foregroundColor(.black)
                                .position(x: 15 + x, y: geomtry.size.height / 2.65 + y)
                                .multilineTextAlignment(.center)
                                .frame(width: 30)
                                .rotationEffect(.degrees(rotation))
                                .animation(.easeOut(duration: 2), value: rotation)
                        }
                    }
                    .offset(y: -50)
                    
                    HStack(spacing: 20) {
                        SmallButton(action: spinWheelModel.goToRecept,
                                    image: ImageName.home.rawValue,
                                    text: "Home")
                        
                        SmallButton(action: spinWheelModel.goToRecept,
                                    image: ImageName.luck.rawValue,
                                    text: "Luck")
                        
                        SmallButton(action: spinWheelModel.goToRecept,
                                    image: ImageName.addForegroundImage.rawValue,
                                    text: "Add")
                        .offset(y: -15)
                        
                        SmallButton(action: spinWheelModel.goToRecept,
                                    image: ImageName.settings.rawValue,
                                    text: "Settings")
                        
                        SmallButton(action: spinWheelModel.goToRecept,
                                    image: ImageName.profile.rawValue,
                                    text: "Profile")
                    }
                }
            }
        }
        .onAppear {
            spinWheel()
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return SpinWheelView(navigationPath: .constant(navigationPath))
}

