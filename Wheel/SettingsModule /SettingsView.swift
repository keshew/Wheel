import SwiftUI

struct SettingsView: View {
    @StateObject var settingsModel =  SettingsViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goToAddRecipe() {
        navigationPath.append(AppScreen.addRecept)
    }
    
    func goToProfile() {
        navigationPath.append(AppScreen.profile)
    }
    
    func goToHome() {
        navigationPath.append(AppScreen.home)
    }
    
    func goToWheel() {
        navigationPath.append(AppScreen.wheel)
    }
    
    var body: some View {
        GeometryReader { geometry in
        ZStack {
                
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                Image(.shadowBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack(spacing: 10) {
                    Image(.settingsLabel)
                        .resizable()
                        .frame(width: geometry.size.width * 0.7,
                               height: geometry.size.height * 0.12)
                    
                    HStack(spacing: 70) {
                        SettingsButton(action: settingsModel.goToMenu,
                                       text: "SETTINGS",
                                       sizeHImage: geometry.size.height * 0.089,
                                       sizeWImage: geometry.size.width * 0.34)
                        
                        SettingsButton(action: settingsModel.goToMenu,
                                       text: "MUSIC",
                                       sizeHImage: geometry.size.height * 0.089,
                                       sizeWImage: geometry.size.width * 0.34)
                    }
                    
                    Text("Wheel")
                        .Ponytail(size: 25)
                        .shadow(color: .black.opacity(0.6), radius: 3, y: 4)
                    
                    VStack(spacing: -5) {
                        ZStack {
                            Image(.receptRectangle)
                                .resizable()
                                .frame(width: geometry.size.width * 0.825,
                                       height: geometry.size.height * 0.164)

                            Image(.pinkWheel)
                                .resizable()
                                .frame(width: geometry.size.width * 0.43,
                                       height: geometry.size.height * 0.13)
                                .scaledToFit()
                                .offset(y: geometry.size.height * 0.015)
                            
                            Text("Pink Strawberry Wheel")
                                .Ponytail(size: 20)
                                .offset(y: -geometry.size.height * 0.065)
                        }
                        
                        SettingsButton(action: settingsModel.goToMenu,
                                       text: "Choose",
                                       sizeHImage: geometry.size.height * 0.082,
                                       sizeWImage: geometry.size.width * 0.32)
                        .offset(y: -5)
                    }
                    
                    Text("Background")
                        .Ponytail(size: 25)
                        .shadow(color: .black.opacity(0.6), radius: 3, y: 4)
                    
                    VStack(spacing: -5) {
                        ZStack {
                            Image(.receptRectangle)
                                .resizable()
                                .frame(width: geometry.size.width * 0.825,
                                       height: geometry.size.height * 0.164)
                            
                            Image(.pinkBackground)
                                .resizable()
                                .frame(width: geometry.size.width * 0.43,
                                       height: geometry.size.height * 0.13)
                                .scaledToFit()
                                .offset(y: geometry.size.height * 0.015)
                            
                            Text("Pink Strawberry Back")
                                .Ponytail(size: 20)
                                .offset(y: -geometry.size.height * 0.065)
                        }
                        
                        SettingsButton(action: settingsModel.goToMenu,
                                       text: "Choose",
                                       sizeHImage: geometry.size.height * 0.082,
                                       sizeWImage: geometry.size.width * 0.32)
                        .offset(y: -5)
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        SmallButton(action: goToHome,
                                    image: ImageName.home.rawValue,
                                    text: "Home")
                        
                        SmallButton(action: goToWheel,
                                    image: ImageName.luck.rawValue,
                                    text: "Luck")
                        
                        SmallButton(action: goToAddRecipe,
                                    image: ImageName.addForegroundImage.rawValue,
                                    text: "Add")
                        .offset(y: -15)
                        
                        SmallButton(action: settingsModel.goToMenu,
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
    return SettingsView(navigationPath: .constant(navigationPath))
}

