import SwiftUI

struct SelectRecipesView: View {
    @StateObject var selectRecipesModel =  SelectRecipesViewModel()
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
                    Image(.selectRecipes)
                        .resizable()
                        .frame(width: 207, height: 108)
                    
                    Text("You can choose only 6 recipes!")
                        .Ponytail(size: 25)
                }
                .padding(.vertical)
                
                VStack(spacing: -20) {
                    ForEach(UserDefaultsManager().loadAllRecept().indices, id: \.self) { array in
                        VStack(spacing: -15) {
                            ScrollView(.horizontal) {
                                HStack {
                                    Group {
                                        ForEach(UserDefaultsManager().loadAllRecept()[array].indices, id: \.self) { index in
                                            Button(action: {
                                                if selectRecipesModel.buttonStates[array].indices.contains(index) {
                                                    selectRecipesModel.buttonStates[array][index].toggle()
                                                    if selectRecipesModel.buttonStates[array][index] {
                                                        if selectRecipesModel.selectedRecipes.count < 6 {
                                                            selectRecipesModel.selectedRecipes.append(UserDefaultsManager().loadAllRecept()[array][index])
                                                        } else {
                                                            selectRecipesModel.buttonStates[array][index].toggle()
                                                        }
                                                    } else {
                                                        if let selectedIndex = selectRecipesModel.selectedRecipes.firstIndex(where: { $0.name == UserDefaultsManager().loadAllRecept()[array][index].name }) {
                                                            selectRecipesModel.selectedRecipes.remove(at: selectedIndex)
                                                        }
                                                    }
                                                }
                                            }) {
                                                ZStack {
                                                    Image(selectRecipesModel.buttonStates[array].indices.contains(index) ? (selectRecipesModel.buttonStates[array][index] ? .choosenItem : .backForItem) : .backForItem)
                                                        .resizable()
                                                        .frame(width: 135, height: 126)
                                                        .shadow(radius: 3, y: 6)
                                                    
                                                    Text(UserDefaultsManager().loadAllRecept()[array][index].name)
                                                        .Rubik(size: 11, outlineWidth: 0.3)
                                                        .lineLimit(2)
                                                        .minimumScaleFactor(0.5)
                                                        .frame(width: 120)
                                                        .offset(y: -40)
                                                    
                                                    Image(UserDefaultsManager().loadAllRecept()[array][index].image)
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
                
                Button(action: {
                    if selectRecipesModel.selectedRecipes.count == 6  {
                        selectRecipesModel.goToRoll()
                    }
                }) {
                    ZStack {
                        Image(.backForSoundButton)
                            .resizable()
                            .frame(width: 119, height: 54)
                        
                        Text("Roll!")
                            .Ponytail(size: 20)
                    }
                }
                
                HStack(spacing: 20) {
                    SmallButton(action: goToWheel,
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
                .padding(.top, 30)
            }
            .scrollIndicators(.hidden)
            
            .navigationDestination(isPresented: $selectRecipesModel.isRollAvailible) {
                RollRecipesView(navigationPath: $navigationPath, items: $selectRecipesModel.selectedRecipes)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return SelectRecipesView(navigationPath: .constant(navigationPath))
}
