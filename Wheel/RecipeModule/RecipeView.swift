import SwiftUI

struct RecipeView: View {
    @StateObject var recipeModel =  RecipeViewModel()
    @Binding var recept: Item
    @Binding var navigationPath: NavigationPath
    
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
    
    func goToLuck() {
        navigationPath.append(AppScreen.gameChoose)
    }
    
    var body: some View {
        ZStack {
            Color.black.opacity(0.5)
            .ignoresSafeArea()
            
            VStack {
                HStack {
                    SmallButton(action: goToLuck,
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
                        Image(.yourReceptLabel)
                            .resizable()
                        .frame(width: 244, height: 146)
                        
                        ZStack {
                            Image(.receptRectangle)
                                .resizable()
                                .frame(width: 327, height: 144)
                                .shadow(color: .black.opacity(0.5), radius: 2, y: 6)
                            
                            Text("\(recept.name)")
                                .Rubik(size: 20)
                                .frame(width: 300)
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .offset(y: -53)
                            
                            Image(recept.detailImage)
                                .resizable()
                                .frame(width: 153, height: 110)
                                .offset(y: 17)
                        }
                        
                        SimpleButton(action: recipeModel.goToMenu,
                                     text: "Go and cook!")
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

#Preview {
    let navigationPath = NavigationPath()
    @State var item = Item(name: "", ingredients: "", recept: "", image: "", detailImage: "")
    return RecipeView(recept: $item, navigationPath: .constant(navigationPath))
}

