import SwiftUI

struct SelectCategoryView: View {
    @StateObject var selectCategoryModel =  SelectCategoryViewModel()
    @Binding var showSelect: Bool
    @Binding var navigationPath: NavigationPath
    
    func goToSelectCategory() {
        showSelect = false
    }
    
    func spinWheel() {
        navigationPath.append(AppScreen.spin)
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
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
                .ignoresSafeArea()
            
            VStack {
                HStack {
                    SmallButton(action: goToSelectCategory,
                                image: ImageName.backArrow.rawValue,
                                text: "Back",
                                sizeImage: 33,
                                offsetXImage: -1)
                    .padding(.horizontal)
                    
                    Spacer()
                }
                
                Image(.selectLabel)
                    .resizable()
                    .frame(width: 398, height: 163)
                
                VStack(spacing: 50) {
                    Spacer()
                    
                    HStack(spacing: 50) {
                        Button(action: {
                            selectCategoryModel.selectButton(number: 1)
                        }) {
                            ZStack {
                                Image(.backForSoundButton)
                                    .resizable()
                                    .frame(width: 130, height: 69)
                                
                                Text("ORANGE")
                                    .Ponytail(size: 20)
                            }
                        }
                        .scaleEffect(selectCategoryModel.selectedButton == 1 ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 0.2), value: selectCategoryModel.selectedButton)
                        
                        Button(action: {
                            selectCategoryModel.selectButton(number: 2)
                        }) {
                            ZStack {
                                Image(.backForSoundButton)
                                    .resizable()
                                    .frame(width: 130, height: 69)
                                
                                Text("PURPLE")
                                    .Ponytail(size: 20)
                            }
                        }
                        .scaleEffect(selectCategoryModel.selectedButton == 2 ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 0.2), value: selectCategoryModel.selectedButton)
                    }
                    
                    HStack(spacing: 50) {
                        Button(action: {
                            selectCategoryModel.selectButton(number: 3)
                        }) {
                            ZStack {
                                Image(.backForSoundButton)
                                    .resizable()
                                    .frame(width: 130, height: 69)
                                
                                Text("Category 1")
                                    .Ponytail(size: 20)
                            }
                        }
                        .scaleEffect(selectCategoryModel.selectedButton == 3 ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 0.2), value: selectCategoryModel.selectedButton)
                        
                        
                        Button(action: {
                            selectCategoryModel.selectButton(number: 4)
                        }) {
                            ZStack {
                                Image(.backForSoundButton)
                                    .resizable()
                                    .frame(width: 130, height: 69)
                                
                                Text("PINK")
                                    .Ponytail(size: 20)
                            }
                        }
                        .scaleEffect(selectCategoryModel.selectedButton == 4 ? 1.2 : 1.0)
                        .animation(.easeInOut(duration: 0.2), value: selectCategoryModel.selectedButton)
                    }
                    
                    Button(action: {
                        if selectCategoryModel.selectedButton ?? 0 > 0 {
                            spinWheel()
                        }
                    }) {
                        ZStack {
                            Image(.backForSoundButton)
                                .resizable()
                                .frame(width: 74, height: 74)
                            
                            Text("GO!")
                                .Ponytail(size: 25)
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        SmallButton(action: goToHome,
                                    image: ImageName.home.rawValue,
                                    text: "Home")
                        
                        SmallButton(action: goToSelectCategory,
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
    @State var preBool = false
    let navigationPath = NavigationPath()
    return SelectCategoryView(showSelect: $preBool, navigationPath: .constant(navigationPath))
}

