import SwiftUI

struct LoadingView: View {
    @StateObject var loadingModel =  LoadingViewModel()
    @State private var navigationPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $navigationPath) {
            ZStack {
                Image(.mainBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                Image(.shadowBackground)
                    .resizable()
                    .ignoresSafeArea()
                
                VStack {
                    Spacer()
                    Image(.labelLoading)
                        .resizable()
                        .frame(width: 380, height: 127)
                    
                    Spacer()
                    Image(.foregroundImageLoading)
                        .resizable()
                        .frame(width: 198, height: 198)
                    
                    Spacer()
                    VStack(spacing: -30) {
                        Text(loadingModel.currentText)
                            .Ponytail(size: 40)
                        
                        ZStack {
                            Image(.loadingLineBackground)
                                .resizable()
                                .frame(width: 318, height: 128)
                            
                            Image(loadingModel.loadScreen().0)
                                .resizable()
                                .frame(width: loadingModel.loadScreen().2, height: 25)
                                .offset(x: loadingModel.loadScreen().1, y: -11.3)
                        }
                    }
                }
            }
            
            .onAppear {
                loadingModel.startTimer()
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    loadingModel.currentIndex = 0
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    loadingModel.currentIndex = 1
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.5) {
                    loadingModel.currentIndex = 2
                    navigationPath.append(AppScreen.home)
                }
            }
            .navigationDestination(for: AppScreen.self) { screen in
                switch screen {
                case .home:
                    HomeView(navigationPath: $navigationPath)
                case .settings:
                    SettingsView(navigationPath: $navigationPath)
                case .profile:
                    ProfileView(navigationPath: $navigationPath)
                case .addCategory:
                    AddCategoryView(navigationPath: $navigationPath)
                case .addRecept:
                    AddReceptView(navigationPath: $navigationPath)
                case .wheel:
                    WheelView(navigationPath: $navigationPath)
                case .select:
                    @State var preBool = false
                    SelectCategoryView(showSelect: $preBool, navigationPath: $navigationPath)
                case .spin:
                    SpinWheelView(navigationPath: $navigationPath)
                case .gameChoose:
                    ChooseGameView(navigationPath: $navigationPath)
                case .selectRecept:
                    SelectRecipesView(navigationPath: $navigationPath)
                case .fav:
                    FavoriteView(navigationPath: $navigationPath)
                case .game:
                    GameView(navigationPath: $navigationPath)
                case .achievements:
                    AchievementsView(navigationPath: $navigationPath)
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}

