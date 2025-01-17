import SwiftUI

struct AchievementsView: View {
    @StateObject var achievementsModel =  AchievementsViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goToAddRecipe() {
        navigationPath.append(AppScreen.addRecept)
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
    
    func goToProfile() {
        navigationPath.append(AppScreen.profile)
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
                    Image(.achievementsLabel)
                        .resizable()
                        .frame(width: 358, height: 85)
                    
                    HStack(spacing: -70) {
                        ZStack {
                            Image(.pressedButtonBack)
                                .resizable()
                                .frame(width: 55, height: 55)
                                .shadow(color: .black.opacity(0.3), radius: 0, y: 4)
                            
                            Image(ImageName.achirvments.rawValue)
                                .resizable()
                                .frame(width: 30, height: 30)
                                .offset(y: -6)
                            
                            Text("Achievements")
                                .font(.custom("Ponytail", size: 7))
                                .foregroundColor(.white)
                                .offset(y: 16)
                        }
                        .padding(.leading, 20)
                        
                        SearchView()
                    }
                    
                    VStack(spacing: 15) {
                        AchievementsIsDone(text: achievementsModel.contact.arrayOfTask[0],
                                           image: UserDefaultsManager.defaults.object(forKey: Keys.countOfMiniGamePlayed.rawValue) as! Int >= 5 ? ImageName.done.rawValue : ImageName.undone.rawValue)
                        
                        AchievementsIsDone(text: achievementsModel.contact.arrayOfTask[1],
                                           image:  UserDefaultsManager.defaults.object(forKey: Keys.wheel.rawValue) as! Int >= 20 ? ImageName.done.rawValue : ImageName.undone.rawValue)
                        
                        AchievementsIsDone(text: achievementsModel.contact.arrayOfTask[2],
                                           image: UserDefaultsManager.defaults.object(forKey: Keys.dice.rawValue) as! Int >= 20 ? ImageName.done.rawValue : ImageName.undone.rawValue)
                        
                        AchievementsIsDone(text: achievementsModel.contact.arrayOfTask[3],
                                           image: UserDefaultsManager.defaults.object(forKey: Keys.countOfCategory.rawValue) as! Int >= 5 ? ImageName.done.rawValue : ImageName.undone.rawValue)
                        
                        AchievementsIsDone(text: achievementsModel.contact.arrayOfTask[4],
                                           image: UserDefaultsManager.defaults.object(forKey: Keys.countOfSelfMadeRecipe.rawValue) as! Int >= 7 ? ImageName.done.rawValue : ImageName.undone.rawValue)
                    }
                    .padding(.top, 15)
                }
                .padding(.vertical)
                
                
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
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return AchievementsView(navigationPath: .constant(navigationPath))
}

