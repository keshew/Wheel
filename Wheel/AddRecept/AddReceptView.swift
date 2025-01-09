import SwiftUI
import PhotosUI

struct AddReceptView: View {
    @StateObject var addReceptModel =  AddReceptViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goToSettings() {
        navigationPath.append(AppScreen.settings)
    }
    
    func goToProfile() {
        navigationPath.append(AppScreen.profile)
    }
    
    func goToHome() {
        navigationPath.append(AppScreen.home)
    }
    
    func goBack() {
        navigationPath.removeLast()
    }
    
    func goToWheel() {
        navigationPath.append(AppScreen.gameChoose)
    }
    
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
            
            Image(.shadowBackground)
                .resizable()
                .ignoresSafeArea()
            
            ScrollView {
                VStack {
                    HStack {
                        SmallButton(action: goBack,
                                    image: ImageName.backArrow.rawValue,
                                    text: "Back",
                                    sizeImage: 33,
                                    offsetXImage: -1)
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    Image(.addNewLabel)
                        .resizable()
                        .frame(width: 266, height: 80)
                    
                    VStack(spacing: -10) {
                        PickImages()
                        
                        HStack {
                            CustomSmallTextEditor()
                            
                            CustomSmallTextEditor(text: "Name category here...")
                        }
                        
                        CustomTextEditor(text: "Write recipe here...",
                                         size: 25)
                        
                        WidthestAddButton(action: addReceptModel.goToMenu)
                            .offset(y: 45)
                    }
                }
                
                HStack(spacing: 20) {
                    SmallButton(action: goToHome,
                                image: ImageName.home.rawValue,
                                text: "Home")
                    
                    SmallButton(action: goToWheel,
                                image: ImageName.luck.rawValue,
                                text: "Luck")
                    
                    SmallButton(action: addReceptModel.goToMenu,
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
                .padding(.top, 5)
            }
            .scrollIndicators(.hidden)
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    let navigationPath = NavigationPath()
    return AddReceptView(navigationPath: .constant(navigationPath))
}

