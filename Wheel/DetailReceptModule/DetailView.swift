import SwiftUI

struct DetailView: View {
    @StateObject var detailModel =  DetailViewModel()
    @Binding var recept: Item
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
    
    func goToHome() {
        navigationPath.append(AppScreen.home)
    }
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                Image(.shadowBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        SmallButton(action: detailModel.goToMenu,
                                    image: ImageName.backArrow.rawValue,
                                    text: "Back",
                                    sizeImage: 33,
                                    offsetXImage: -1)
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    Image(.receptLabel)
                        .resizable()
                        .frame(width: geometry.size.width * 0.58,
                               height: geometry.size.height * 0.13)
                    
                    VStack(spacing: 20) {
                        ZStack {
                            Image(.receptRectangle)
                                .resizable()
                                .frame(width: geometry.size.width * 0.85,
                                       height: geometry.size.height * 0.18)
                                .shadow(color: .black.opacity(0.9), radius: 3, y: 4)
                            
                            Text("\(recept.name)")
                                .Rubik(size: 20)
                                .lineLimit(1)
                                .frame(width: geometry.size.width * 0.75)
                                .minimumScaleFactor(0.5)
                                .offset(y: -50)
                            
                            Image(recept.detailImage)
                                .resizable()
                                .scaledToFit()
                                .frame(width: geometry.size.width * 0.40,
                                       height: geometry.size.height * 0.135)
                                .offset(y: 17)
                        }
                        
                        ZStack {
                            Image(.mainRectangleRecept)
                                .resizable()
                                .frame(width: geometry.size.width * 0.85,
                                       height: geometry.size.height * 0.43)
                                .shadow(color: .black.opacity(0.9), radius: 3, y: 4)
                            
                            VStack {
                                Text("\u{2022} Ingridients: \(recept.ingredients)")
                                    .Rubik(size: 18, outlineWidth: 0.0)
                                    .frame(width: geometry.size.width * 0.75,
                                           height: geometry.size.height * 0.21)
                                    .minimumScaleFactor(0.5)
                                
                                Text("\u{2022} Recipe: \(recept.recept)")
                                    .Rubik(size: 18, outlineWidth: 0.0)
                                    .frame(width: geometry.size.width * 0.75,
                                           height: geometry.size.height * 0.24)
                                    .minimumScaleFactor(0.5)
                                    .offset(y: -50)
                            }
                        }
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 20) {
                        SmallButton(action: goToHome,
                                    image: ImageName.home.rawValue,
                                    text: "Home")
                        
                        SmallButton(action: detailModel.goToMenu,
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
            .navigationDestination(isPresented: $detailModel.isMenuAvailible) {
                HomeView(navigationPath: $navigationPath)
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    @State var recept = Item(name: "", ingredients: "", recept: "", image: "", detailImage: "")
    return DetailView(recept: $recept, navigationPath: .constant(navigationPath))
}

