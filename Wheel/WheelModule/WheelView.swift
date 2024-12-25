import SwiftUI

struct WheelView: View {
    @StateObject var wheelModel =  WheelViewModel()
    @Binding var navigationPath: NavigationPath
    @State private var rotation: Double = 0
    @State private var selectedSegment: String = ""
    @State var showSelect = false
    
    func goToSelect() {
        showSelect.toggle()
    }
    
    func goToHome() {
        navigationPath.append(AppScreen.home)
    }
    
    func goToAddRecipe() {
        navigationPath.append(AppScreen.addRecept)
    }
    
    func goToSettings() {
        navigationPath.append(AppScreen.settings)
    }
    
    func goToProfile() {
        navigationPath.append(AppScreen.profile)
    }
    
    private func generateRandomValues() -> [String] {
        var arrayString: [String] = []
        let nestedArray = UserDefaultsManager().loadAllRecept()
         
        let firstArray = nestedArray.first
        arrayString = (0..<16).compactMap { index in
            firstArray!.randomElement()?.name
         }
        
        return arrayString
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
                
                if showSelect {
                    SelectCategoryView(showSelect: $showSelect, navigationPath: $navigationPath)
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
                            
                            Text(generateRandomValues()[index])
                                .Rubik(size: 6, outlineWidth: 0.0)
                                .foregroundColor(.black)
                                .position(x: 15 + x, y: geomtry.size.height / 2.65 + y)
                                .multilineTextAlignment(.center)
                                .frame(width: 30)
                                .rotationEffect(.degrees(rotation))
                                .animation(.easeOut(duration: 2), value: rotation)
                        }
                        
                        HStack {
                            Text("You can switch color after 5 days")
                                .Ponytail(size: 15)
                                .frame(width: 110)
                                .multilineTextAlignment(.center)
                            
                            Button(action: {
                                goToSelect()
                            }) {
                                ZStack {
                                    Image(.backForSoundButton)
                                        .resizable()
                                        .frame(width: 119, height: 55)
                                    
                                    Text("SPIN!")
                                        .Ponytail(size: 20)
                                }
                            }
                            
                            Text("You can switch background after 5 days")
                                .Ponytail(size: 15)
                                .frame(width: 120)
                                .multilineTextAlignment(.center)
                        }
                        .offset(y: 190)
                    }
                    .offset(y: -50)
                    
                    HStack(spacing: 20) {
                        SmallButton(action: goToHome,
                                    image: ImageName.home.rawValue,
                                    text: "Home")
                        
                        SmallButton(action: wheelModel.goToMenu,
                                    image: ImageName.luck.rawValue,
                                    text: "Luck")
                        
                        SmallButton(action: goToAddRecipe,
                                    image: ImageName.addForegroundImage.rawValue,
                                    text: "Add")
                        .offset(y: -15)
                        
                        SmallButton(action: goToSettings,
                                    image: ImageName.settings.rawValue,
                                    text: "Settings")
                        
                        SmallButton(action: goToProfile,
                                    image: ImageName.profile.rawValue,
                                    text: "Profile")
                    }
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return WheelView(navigationPath: .constant(navigationPath))
}
