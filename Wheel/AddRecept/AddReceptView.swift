import SwiftUI
import PhotosUI

struct AddReceptView: View {
    @StateObject var addReceptModel =  AddReceptViewModel()
    @Binding var navigationPath: NavigationPath
    
    func goToSettings() {
        navigationPath.append(AppScreen.settings)
    }
    
    func goToProfile() {
        navigationPath.append(AppScreen.profile)
    }
    
    func goToHome() {
        navigationPath.append(AppScreen.home)
    }
    
    func goBack() {
        navigationPath.removeLast()
    }
    
    func goToWheel() {
        navigationPath.append(AppScreen.gameChoose)
    }
    
    func saveRecipe(name: String, ingredients: String, recept: String, image: String) {
        UserDefaultsManager().saveNewSelfRecipes(Item(name: name,
                                                      ingredients: ingredients,
                                                      recept: recept,
                                                      image: image,
                                                      detailImage: image,
                                                      isRecipeOfMounth: false))
        UserDefaultsManager().addRecipesCount()
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
                    HStack {
                        SmallButton(action: goBack,
                                    image: ImageName.backArrow.rawValue,
                                    text: "Back",
                                    sizeImage: 33,
                                    offsetXImage: -1)
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                    
                    Image(.addNewLabel)
                        .resizable()
                        .frame(width: 266, height: 80)
                    
                    VStack(spacing: -10) {
                        PhotosPicker(
                            selection: $addReceptModel.selectedItem,
                            matching: .images,
                            photoLibrary: .shared()) {
                                if let selectedImage = addReceptModel.selectedImage {
                                    selectedImage
                                        .resizable()
                                        .frame(width: 200, height: 200)
                                        .cornerRadius(100)
                                } else {
                                    ZStack {
                                        Image(.picForCategory)
                                            .resizable()
                                            .frame(width: 200, height: 200)
                                        
                                        Text("Place your Photo here...")
                                            .Ponytail(size: 18)
                                    }
                                }
                            }
                            .onChange(of: addReceptModel.selectedItem) { oldItem, newItem in
                                guard let newItem else { return }
                                Task {
                                    if let data = try? await newItem.loadTransferable(type: Data.self),
                                       let uiImage = UIImage(data: data) {
                                        addReceptModel.selectedImage = Image(uiImage: uiImage)
                                        if let imageData = uiImage.jpegData(compressionQuality: 0.5) {
                                            let base64String = imageData.base64EncodedString()
                                            addReceptModel.imageString = base64String
                                        }
                                    }
                                }
                            }
                        
                        HStack {
                            TextEditor(text: $addReceptModel.text2)
                                .padding()
                                .font(.custom("Ribik", size: 15))
                                .foregroundColor(.white)
                                .outlineText(width: 0.2)
                                .shadow(color: .black.opacity(0.3), radius: 2, y: 6)
                                .background(
                                    Image(.nameForCategoryBack)
                                        .resizable()
                                        .frame(width: 162, height: 93)
                                )
                                .frame(width: 162, height: 93)
                                .scrollContentBackground(.hidden)
                                .scrollIndicators(.hidden)
                                .padding()
                                .onTapGesture {
                                    withAnimation {
                                        addReceptModel.text2 = ""
                                    }
                                }
                            
                            TextEditor(text: $addReceptModel.text3)
                                .padding()
                                .font(.custom("Ribik", size: 15))
                                .foregroundColor(.white)
                                .outlineText(width: 0.2)
                                .shadow(color: .black.opacity(0.3), radius: 2, y: 6)
                                .background(
                                    Image(.nameForCategoryBack)
                                        .resizable()
                                        .frame(width: 162, height: 93)
                                )
                                .frame(width: 162, height: 93)
                                .scrollContentBackground(.hidden)
                                .scrollIndicators(.hidden)
                                .padding()
                                .onTapGesture {
                                    withAnimation {
                                        addReceptModel.text3 = ""
                                    }
                                }
                        }
                        
                        TextEditor(text: $addReceptModel.text)
                            .padding()
                            .font(.custom("Ribik", size: 25))
                            .foregroundColor(.white)
                            .outlineText(width: 0.2)
                            .shadow(color: .black.opacity(0.3), radius: 2, y: 6)
                            .background(
                                Image(.nameForCategoryBack)
                                    .resizable()
                                    .frame(width: 341, height: 181)
                            )
                            .frame(width: 341, height: 181)
                            .scrollContentBackground(.hidden)
                            .scrollIndicators(.hidden)
                            .padding()
                            .onTapGesture {
                                withAnimation {
                                    addReceptModel.text = ""
                                }
                            }
                        
                        Button(action: {
                            if addReceptModel.text != "" || addReceptModel.text2 != "" || addReceptModel.text3 != "" {
                                saveRecipe(name: addReceptModel.text3, ingredients: addReceptModel.text2, recept: addReceptModel.text, image: addReceptModel.imageString)
                                navigationPath.append(AppScreen.profile)
                            }
                        }) {
                            ZStack {
                                Image(.backForAddButton)
                                    .resizable()
                                    .frame(width: 100, height: 55)
                                
                                Image(name: .addForegroundImage)
                                    .resizable()
                                    .frame(width: 21, height: 21)
                                    .offset(y: -10)
                                
                                Text("Add")
                                    .Ponytail(size: 18)
                                    .offset(y: 14)
                            }
                        }
                        .offset(y: -30)
                    }
                }
                
                HStack(spacing: 20) {
                    SmallButton(action: goToHome,
                                image: ImageName.home.rawValue,
                                text: "Home")
                    
                    SmallButton(action: goToWheel,
                                image: ImageName.luck.rawValue,
                                text: "Luck")
                    
                    SmallButton(action: addReceptModel.goToMenu,
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
                .padding(.top, 5)
            }
            .scrollIndicators(.hidden)
        }
        .navigationBarBackButtonHidden(true)
    }
}


#Preview {
    let navigationPath = NavigationPath()
    return AddReceptView(navigationPath: .constant(navigationPath))
}

