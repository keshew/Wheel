import SwiftUI

struct HomeView: View {
    @StateObject var homeModel =  HomeViewModel()
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
    
    func goToFavorite() {
        navigationPath.append(AppScreen.fav)
    }
    
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
            
            Image(.shadowBackground)
                .resizable()
                .ignoresSafeArea()
            
            if homeModel.isWaitAvailible {
                WaitModuleView(navigationPath: $navigationPath, showWait: $homeModel.isWaitAvailible)
                    .frame(maxWidth: UIScreen.main.bounds.width, maxHeight: UIScreen.main.bounds.height)
                    .zIndex(1)
            }
            
            ScrollView {
                VStack {
                    Image(.homeLabel)
                        .resizable()
                        .frame(width: 196, height: 97)
                    HStack(spacing: -70) {
                        SearchView()
                        
                        SmallButton(action: goToFavorite,
                                    image: ImageName.star.rawValue,
                                    text: "Favorite")
                        .padding(.trailing, 20)
                    }
                }
                
                .padding(.vertical)
                
                VStack(spacing: -5) {
                    ForEach(UserDefaultsManager().loadAllRecept().indices, id: \.self) { array in
                        VStack(spacing: -15) {
                            HStack {
                                Text(homeModel.contact.nameOfArrays[array])
                                    .Ponytail(size: 20)
                                    .padding(.leading, 25)
                                Spacer()
                            }
                            
                            ScrollView(.horizontal) {
                                HStack {
                                    Group {
                                        ForEach(UserDefaultsManager().loadAllRecept()[array], id: \.name) { index in
                                            Button(action: {
                                                if index.isRecipeOfMounth {
                                                    if UserDefaultsManager().checkIfDayPassed() {
                                                        navigationPath.append(AppScreen.game)
                                                    } else {
                                                        homeModel.isWaitAvailible = true
                                                    }
                                                } else {
                                                    homeModel.goToDetail(with: index)
                                                }
                                            }) {
                                                if index.isRecipeOfMounth {
                                                    ZStack {
                                                        Image(.backForItem)
                                                            .resizable()
                                                            .frame(width: 135, height: 126)
                                                            .shadow(radius: 3, y: 6)
                                                            .blur(radius: 2)
                                                        Text(index.name)
                                                            .Rubik(size: 11, outlineWidth: 0.3)
                                                            .lineLimit(2)
                                                            .minimumScaleFactor(0.5)
                                                            .frame(width: 120)
                                                            .offset(y: -40)
                                                            .blur(radius: 2)
                                                        Image(index.image)
                                                            .resizable()
                                                            .frame(width: 80, height: 80)
                                                            .offset(y: 15)
                                                            .blur(radius: 2)
                                                        Image(name: .question)
                                                            .resizable()
                                                            .frame(width: 50, height: 80)
                                                            .offset(y: 5)
                                                    }
                                                } else {
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
                    SmallButton(action: homeModel.goToMenu,
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
            .navigationDestination(isPresented: $homeModel.isDetailAvailible) {
                DetailView(recept: $homeModel.recept ,navigationPath: $navigationPath)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return HomeView(navigationPath: .constant(navigationPath))
}

