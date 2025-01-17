import SwiftUI

struct ProfileView: View {
    @StateObject var profileModel =  ProfileViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goToAddRecipe() {
        navigationPath.append(AppScreen.addRecept)
    }
    
    func goToAddCategory() {
        navigationPath.append(AppScreen.addCategory)
    }
    
    func goToSettings() {
        navigationPath.append(AppScreen.settings)
    }
    
    func goToHome() {
        navigationPath.append(AppScreen.home)
    }
    
    func goToWheel() {
        navigationPath.append(AppScreen.gameChoose)
    }
    
    func goToAchevment() {
        navigationPath.append(AppScreen.achievements)
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
                    VStack {
                        Image(.profileLabel)
                            .resizable()
                            .frame(width: 273, height: 94)
                        
                        HStack(spacing: -70) {
                            SmallButton(action: goToAchevment,
                                        image: ImageName.achirvments.rawValue,
                                        text: "Achievements",
                                        textSize: 7.4,
                                        sizeImage: 30)
                            
                            .padding(.leading, 20)
                            SearchView()
                            
                        }
                    }
                    
                    
                    
                    VStack(spacing: 20) {
                        VStack(spacing: 0) {
                            HStack(spacing: -10) {
                                Text("Your categories")
                                    .Ponytail(size: 20)
                                    .padding(.horizontal)
                                
                                Button(action: {
                                    goToAddCategory()
                                }) {
                                    Image(.addCategoryButton)
                                        .resizable()
                                        .frame(width: 28, height: 28)
                                }
                                
                                Spacer()
                                
                            }
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(UserDefaultsManager().loadAllCategory(), id: \.nameCategory) { category in
                                        ZStack {
                                            if let image = profileModel.convertBase64ToImage(base64String: category.imageOfCategory) {
                                                image
                                                    .resizable()
                                                    .frame(width: 135, height: 126)
                                                    .cornerRadius(20)
                                                    .shadow(radius: 3, y: 6)
                                            } else {
                                                Image(category.imageOfCategory)
                                                    .resizable()
                                                    .frame(width: 135, height: 126)
                                                    .shadow(radius: 3, y: 6)
                                            }
                                            
                                            Text(category.nameCategory)
                                                .Rubik(size: 30)
                                                .frame(width: 110, height: 120)
                                                .minimumScaleFactor(0.8)
                                            
                                        }
                                        .padding(.leading, 10)
                                        .padding(.trailing, 10)
                                    }
                                }
                            }
                        }
                        
                        
                        VStack(spacing: 0) {
                            HStack(spacing: -10) {
                                Text(profileModel.contact.nameOfArrays[1])
                                    .Ponytail(size: 20)
                                    .padding(.horizontal)
                                
                                Spacer()
                            }
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(0..<profileModel.contact.lastRecipeArray.count, id: \.self) { recept in
                                        ZStack {
                                            Image(.profileRectangle)
                                                .resizable()
                                                .frame(width: 135, height: 126)
                                                .shadow(radius: 3, y: 6)
                                            
                                            Text(profileModel.contact.lastRecipeArray[recept].nameOfRecipe)
                                                .Rubik(size: 12, outlineWidth: 0.4)
                                                .frame(width: 130)
                                                .multilineTextAlignment(.center)
                                                .minimumScaleFactor(0.5)
                                                .offset(y: -43)
                                            
                                            Image(profileModel.contact.lastRecipeArray[recept].imageOfRecipe)
                                                .resizable()
                                                .frame(width: 84, height: 84)
                                                .offset(y: 15)
                                            
                                            
                                        }
                                        .padding(.leading, 10)
                                        .padding(.trailing, 10)
                                    }
                                }
                            }
                        }
                        
                        VStack(alignment: .leading, spacing: 0) {
                            HStack(spacing: -10) {
                                Text(profileModel.contact.nameOfArrays[2])
                                    .Ponytail(size: 20)
                                    .padding(.horizontal)
                                
                                
                                Spacer()
                            }
                            ScrollView(.horizontal) {
                                HStack {
                                    ForEach(UserDefaultsManager().loadSelfRecipes(), id: \.name) { selfMakeRecept in
                                        ZStack {
                                            if let image = profileModel.convertBase64ToImage(base64String: selfMakeRecept.image) {
                                                image
                                                    .resizable()
                                                    .frame(width: 135, height: 126)
                                                    .cornerRadius(20)
                                                    .shadow(radius: 3, y: 6)
                                            } else {
                                                Image(.profileRectangle)
                                                    .resizable()
                                                    .frame(width: 135, height: 126)
                                                    .shadow(radius: 3, y: 6)
                                            }
                                            
                                            Text(selfMakeRecept.name)
                                                .Rubik(size: 20)
                                                .frame(width: 130)
                                        }
                                        .padding(.leading, 10)
                                        .padding(.trailing, 10)
                                    }
                                }
                            }
                        }
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
                        
                        SmallButton(action: goToSettings,
                                    image: ImageName.settings.rawValue,
                                    text: "Settings")
                        
                        SmallButton(action: profileModel.goToMenu,
                                    image: ImageName.profile.rawValue,
                                    text: "Profile")
                    }
                    .padding(.top, 35)
                }
            }
            .scrollIndicators(.hidden)
        }
        .navigationDestination(isPresented: $profileModel.isDetailAvailible) {
            DetailView(recept: $profileModel.recept ,navigationPath: $navigationPath)
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return ProfileView(navigationPath: .constant(navigationPath))
}

