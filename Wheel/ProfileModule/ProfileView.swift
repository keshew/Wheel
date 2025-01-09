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
                        
                        SearchView()
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
                                    ForEach(0..<profileModel.contact.categoriesArray.count, id: \.self) { category in
                                        ZStack {
                                            Image(.profileRectangle)
                                                .resizable()
                                                .frame(width: 135, height: 126)
                                                .shadow(radius: 3, y: 6)
                                            
                                            Text(profileModel.contact.categoriesArray[category])
                                                .Rubik(size: 30)
                                            
                                        }
                                        .padding(.leading)
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
                                        .padding(.leading)
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
                                    ForEach(0..<profileModel.contact.selfMadeRecipe.count, id: \.self) { selfMakeRecept in
                                    ZStack {
                                        Image(.profileRectangle)
                                            .resizable()
                                            .frame(width: 135, height: 126)
                                            .shadow(radius: 3, y: 6)
                                        
                                        Text(profileModel.contact.selfMadeRecipe[selfMakeRecept])
                                            .Rubik(size: 20)
                                        
                                    }
                                    .padding(.leading)
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
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return ProfileView(navigationPath: .constant(navigationPath))
}

