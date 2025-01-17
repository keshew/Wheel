import SwiftUI

struct WaitModuleView: View {
    @StateObject var waitModuleModel =  WaitModuleViewModel()
    @Binding var navigationPath: NavigationPath
    @Binding var showWait: Bool
    
    func goToHome() {
        showWait = false
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
    
    func goToLuck() {
        navigationPath.append(AppScreen.wheel)
    }
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                Color.black.opacity(0.5)
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        SmallButton(action: goToHome,
                                    image: ImageName.backArrow.rawValue,
                                    text: "Back",
                                    sizeImage: 33,
                                    offsetXImage: -1)
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    VStack {
                        Spacer()
                        
                        VStack(spacing: 60) {
                            Image(.waitLabel)
                                .resizable()
                                .frame(width: 342, height: 84)
                            
                            ZStack {
                                Image(.mainRectangleRecept)
                                    .resizable()
                                    .frame(width: geometry.size.width * 0.85,
                                           height: geometry.size.height * 0.43)
                                    .shadow(color: .black.opacity(0.9), radius: 3, y: 4)
                                
                                Text("You need to wait 24 hours before opening the next recipe of the month! You can only open 1 recipe per day, so come back tomorrow!")
                                    .Rubik(size: 25, outlineWidth: 0.5)
                                    .lineSpacing(5)
                                    .frame(width: geometry.size.width * 0.75,
                                           height: geometry.size.height * 0.4)
                                    .multilineTextAlignment(.center)
                                    .offset(y: -10)
                            }
                        }
                        
                        
                        Spacer()
                        
                        HStack(spacing: 20) {
                            SmallButton(action: goToHome,
                                        image: ImageName.home.rawValue,
                                        text: "Home")
                            
                            SmallButton(action: goToLuck,
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
}

#Preview {
    let navigationPath = NavigationPath()
    @State var showWait = false
    return WaitModuleView(navigationPath: .constant(navigationPath), showWait: $showWait)
}

