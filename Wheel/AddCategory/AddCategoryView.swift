import SwiftUI
import PhotosUI

struct AddCategoryView: View {
    @StateObject var addCategoryModel =  AddCategoryViewModel()
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
    
    func goBack() {
        navigationPath.removeLast()
    }
    
    func goToWheel() {
        navigationPath.append(AppScreen.gameChoose)
    }
    
    func saveCategory(text: String, image: String) {
        UserDefaultsManager().saveNewCategory(CategoryModel(nameCategory: text, imageOfCategory: image))
        UserDefaultsManager().addCategoryCount()
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
                    
                    VStack(spacing: 50) {
                        PhotosPicker(
                            selection: $addCategoryModel.selectedItem,
                            matching: .images,
                            photoLibrary: .shared()) {
                                if let selectedImage = addCategoryModel.selectedImage {
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
                            .onChange(of: addCategoryModel.selectedItem) { oldItem, newItem in
                                guard let newItem else { return }
                                Task {
                                    if let data = try? await newItem.loadTransferable(type: Data.self),
                                       let uiImage = UIImage(data: data) {
                                        addCategoryModel.selectedImage = Image(uiImage: uiImage)
                                        if let imageData = uiImage.jpegData(compressionQuality: 0.5) {
                                            let base64String = imageData.base64EncodedString()
                                            addCategoryModel.imageString = base64String
                                        }
                                    }
                                }
                            }
                        
                        TextEditor(text: $addCategoryModel.text)
                            .padding()
                            .font(.custom("Ribik", size: 20))
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
                                    addCategoryModel.text = ""
                                }
                            }
                        
                        Button(action: {
                            if addCategoryModel.selectedImage == nil  {
                                saveCategory(text: addCategoryModel.text, image: ImageName.profileRectangle.rawValue)
                                navigationPath.append(AppScreen.profile)
                            } else if addCategoryModel.text == "" {
                                saveCategory(text: "Category", image: addCategoryModel.imageString)
                                navigationPath.append(AppScreen.profile)
                            } else if addCategoryModel.selectedImage == nil || addCategoryModel.text == "" {
                                saveCategory(text: "Category", image: ImageName.profileRectangle.rawValue)
                                navigationPath.append(AppScreen.profile)
                            } else {
                                saveCategory(text: addCategoryModel.text, image: addCategoryModel.imageString)
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
                        .offset(y: -70)
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
            }
            .scrollIndicators(.hidden)
        }
        .navigationBarBackButtonHidden(true)
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return AddCategoryView(navigationPath: .constant(navigationPath))
}

