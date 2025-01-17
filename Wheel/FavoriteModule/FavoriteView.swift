import SwiftUI

struct FavoriteView: View {
    @StateObject var favoriteModel =  FavoriteViewModel()
    @Binding var navigationPath: NavigationPath
    func goToAddRecipe() {
        navigationPath.append(AppScreen.addRecept)
    }
    
    func goToSettings() {
        navigationPath.append(AppScreen.settings)
    }
    
    func goToProfile() {
        navigationPath.append(AppScreen.profile)
    }
    
    func goToWheel() {
        navigationPath.append(AppScreen.gameChoose)
    }
    
    func goToHome() {
        navigationPath.append(AppScreen.home)
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
                    Image(.favLabel)
                        .resizable()
                        .frame(width: 260, height: 81)
                    HStack(spacing: -70) {
                        SearchView()
                        
                        ZStack {
                            Image(.pressedButtonBack)
                                .resizable()
                                .frame(width: 55, height: 55)
                                .shadow(color: .black.opacity(0.3), radius: 0, y: 4)
                            
                            Image(ImageName.star.rawValue)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .offset(y: -6)
                            
                            Text("Favorite")
                                .font(.custom("Ponytail", size: 12))
                                .foregroundColor(.white)
                                .offset(y: 16)
                        }
                        .disabled(true)
                        .padding(.trailing, 20)
                    }
                }
                
                .padding(.vertical)
                
                VStack(spacing: -5) {
                    ForEach(favoriteModel.contact.allArray.indices, id: \.self) { array in
                        VStack(spacing: -15) {
                            ScrollView(.horizontal) {
                                HStack {
                                    Group {
                                        ForEach(favoriteModel.contact.allArray[array], id: \.name) { index in
                                            Button(action: {
                                                favoriteModel.goToDetail(with: index)
                                            }) {
                                                ZStack {
                                                    Image(.backForItem)
                                                        .resizable()
                                                        .frame(width: 135, height: 126)
                                                        .shadow(radius: 3, y: 6)
                                                    
                                                    Text(index.name)
                                                        .Rubik(size: 11, outlineWidth: 0.3)
                                                        .lineLimit(2)
                                                        .minimumScaleFactor(0.5)
                                                        .frame(width: 120)
                                                        .offset(y: -40)
                                                    
                                                    Image(index.image)
                                                        .resizable()
                                                        .frame(width: 80, height: 80)
                                                        .offset(y: 15)
                                                }
                                            }
                                            .padding(.horizontal, 5)
                                            
                                        }
                                    }
                                }
                                .padding()
                            }
                            .scrollIndicators(.hidden)
                        }
                    }
                }
                
                
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
                    
                    SmallButton(action: goToProfile,
                                image: ImageName.profile.rawValue,
                                text: "Profile")
                }
                .padding(.top)
            }
            .scrollIndicators(.hidden)
            .navigationDestination(isPresented: $favoriteModel.isDetailAvailible) {
                DetailView(recept: $favoriteModel.recept ,navigationPath: $navigationPath)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return FavoriteView(navigationPath: .constant(navigationPath))
}

