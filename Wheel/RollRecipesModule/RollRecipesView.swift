import SwiftUI
import CoreMotion

struct RollRecipesView: View {
    @StateObject var rollRecipesModel =  RollRecipesViewModel()
    @Binding var navigationPath: NavigationPath
    @Binding var items: [Item]
    @State private var hasExecuted = false
    @State private var motionManager = CMMotionManager()
    
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
    
    func startTracking() {
        if motionManager.isAccelerometerAvailable {
            motionManager.accelerometerUpdateInterval = 0.1
            motionManager.startAccelerometerUpdates(to: .main) { (data, error) in
                guard let data = data else { return }
                detectShake(acceleration: data.acceleration)
            }
        }
    }
    
    func stopTracking() {
        motionManager.stopAccelerometerUpdates()
    }
    
    func detectShake(acceleration: CMAcceleration) {
        let threshold = 2.0
        if abs(acceleration.x) > threshold || abs(acceleration.y) > threshold || abs(acceleration.z) > threshold {
            guard !hasExecuted else { return }
            startAnimation()
            hasExecuted = true
        }
    }
    
    func startAnimation() {
        rollRecipesModel.isAnimating = true
        rollRecipesModel.timer = Timer.scheduledTimer(withTimeInterval: 0.2, repeats: true) { _ in
            withAnimation(.easeInOut(duration: 0.5)) {
                rollRecipesModel.currentSide = (rollRecipesModel.currentSide % 6) + 1
                rollRecipesModel.rotationAngle += 90
            }
        }
        
        let randomTime = TimeInterval.random(in: 3...6)
        rollRecipesModel.stopTimer = Timer.scheduledTimer(withTimeInterval: randomTime, repeats: false) { _ in
            stopAnimation()
        }
    }
    
    func stopAnimation() {
        rollRecipesModel.isAnimating = false
        rollRecipesModel.timer?.invalidate()
        rollRecipesModel.timer = nil
        rollRecipesModel.stopTimer?.invalidate()
        rollRecipesModel.stopTimer = nil
        rollRecipesModel.showRecept = true
        rollRecipesModel.selectedItem = items[rollRecipesModel.currentSide - 1]
    }
    
    var body: some View {
        ZStack {
            Image(.mainBackground)
                .resizable()
                .ignoresSafeArea()
            
            Image(.shadowBackground)
                .resizable()
                .ignoresSafeArea()
            
            if rollRecipesModel.showRecept {
                RecipeView(recept: $rollRecipesModel.selectedItem, navigationPath: $navigationPath)
                    .frame(maxWidth: UIScreen.main.bounds.width,
                           maxHeight: UIScreen.main.bounds.height)
                     .zIndex(1)
            }
            
            VStack(spacing: 0) {
                HStack {
                    SmallButton(action: rollRecipesModel.goToMenu,
                                image: ImageName.backArrow.rawValue,
                                text: "Back",
                                sizeImage: 33,
                                offsetXImage: -1)
                    .padding(.horizontal)
                    Spacer()
                }
                
                Image(.rollThemLabel)
                    .resizable()
                    .frame(width: 357, height: 153)
                
                
                Spacer()
                
                VStack(spacing: 0) {
                    ZStack {
                        Image(.backForDice)
                            .resizable()
                            .frame(width: 264, height: 264)
                        
                        Image("dice\(rollRecipesModel.currentSide)")
                            .resizable()
                            .rotationEffect(Angle(degrees: rollRecipesModel.rotationAngle))
                            .frame(width: 147, height: 147)
                    }
                    
                    VStack {
                        Button(action: {
                            startAnimation()
                        }) {
                            ZStack {
                                Image(.backForSoundButton)
                                    .resizable()
                                    .frame(width: 119, height: 54)
                                
                                Text("Roll!")
                                    .Ponytail(size: 20)
                            }
                        }
                        .disabled(rollRecipesModel.isAnimating ? true : false)
                        
                        Text("And you can roll your dice by shaking your phone!")
                            .Ponytail(size: 15)
                            .frame(width: 130)
                            .multilineTextAlignment(.center)
                    }
                    .offset(y: -20)
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
                    
                    SmallButton(action: goToProfile,
                                image: ImageName.profile.rawValue,
                                text: "Profile")
                }
                
            }
        }
        .onAppear {
            startTracking()
        }
        .onDisappear {
            stopTracking()
        }
        
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    @State var items = [Item(name: "",
                             ingredients: "",
                             recept: "",
                             image: "",
                             detailImage: "")]
    return RollRecipesView(navigationPath: .constant(navigationPath), items: $items)
}

