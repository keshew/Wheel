import SwiftUI

struct ChooseGameView: View {
    @StateObject var chooseGameModel =  ChooseGameViewModel()
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
    
    func goToSettings() {
        navigationPath.append(AppScreen.settings)
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
                
                VStack {
                    ScrollView {
                        Image(.testYourLuckLabel)
                            .resizable()
                            .frame(width: 368, height: 157)
                        
                        VStack(spacing: 70) {
                            ZStack {
                                Image(.receptRectangle)
                                    .resizable()
                                    .frame(width: 327,
                                           height: 173)
                                    .scaledToFit()
                               
                                Image(.pinkWheel)
                                    .resizable()
                                    .frame(width: 153,
                                           height: 128)
                                    .scaledToFit()
                                    .offset(y: geometry.size.height * 0.029)
                                
                                Text("Wheel")
                                    .Rubik(size: 20)
                                    .offset(y: geometry.size.height * -0.08)
                                
                                Button(action: {
                                    navigationPath.append(AppScreen.wheel)
                                }) {
                                    ZStack {
                                        Image(.backForSoundButton)
                                            .resizable()
                                            .frame(width: 119, height: 54)
                                        
                                        Text("Play")
                                            .Ponytail(size: 20)
                                    }
                                }
                                .offset(y: geometry.size.height * 0.14)
                            }
                            
                            ZStack {
                                Image(.receptRectangle)
                                    .resizable()
                                    .frame(width: 327,
                                           height: 173)
                                    .scaledToFit()
                               
                                Image(.dice)
                                    .resizable()
                                    .frame(width: 350,
                                           height: 160)
                                    .scaledToFit()
                                    .offset(y: geometry.size.height * 0.015)
                                
                                Text("DICE")
                                    .Rubik(size: 20)
                                    .offset(y: geometry.size.height * -0.08)
                                
                                Button(action: {
                                    navigationPath.append(AppScreen.selectRecept)
                                }) {
                                    ZStack {
                                        Image(.backForSoundButton)
                                            .resizable()
                                            .frame(width: 119, height: 54)
                                        
                                        Text("Play")
                                            .Ponytail(size: 20)
                                    }
                                }
                                .offset(y: geometry.size.height * 0.14)
                            }
                            
                            HStack(spacing: 20) {
                                SmallButton(action: goToHome,
                                            image: ImageName.home.rawValue,
                                            text: "Home")
                                
                                SmallButton(action: chooseGameModel.goToMenu,
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
                            .padding(.top, 40)
                        }
                    }
                    .scrollIndicators(.hidden)
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return ChooseGameView(navigationPath: .constant(navigationPath))
}

