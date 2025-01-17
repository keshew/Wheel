import SwiftUI
import PhotosUI

struct SearchView: View {
    @State var show = true
    @State var text = ""
    @FocusState var isTyping: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: show ? 15 : 30)
                .foregroundStyle(.thinMaterial)
                .shadow(color: .black.opacity(0.1), radius: 0, y: 6)
            HStack {
                Image(systemName: "magnifyingglass").font(.title2)
                    .foregroundStyle(.primary.opacity(0.5))
                    .contentTransition(.symbolEffect)
                    .onTapGesture {
                        withAnimation {
                            text = ""
//                            show.toggle()
//                            isTyping.toggle()
                        }
                    }
                
                TextField("Search...", text: $text)
                    .focused($isTyping)
                    .opacity(isTyping ? 0 : 1)
            }
            .padding(.leading, 11)
        }
        .frame(width: 220, height: 50)
        .frame(maxWidth: .infinity, alignment: .center)
//        .padding(.leading, 55)
    }
}

struct WidthestAddButton: View {
    var action: () -> Void
    var body: some View {
        Button(action: {
            action()
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

struct SmallButton: View {
    var action: () -> Void
    var image: String
    var text: String
    var textSize: CGFloat = 12
    var sizeImage: CGFloat = 24
    var offsetXImage: CGFloat = 0
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.backForHomeButton)
                    .resizable()
                    .frame(width: 55, height: 55)
                    .shadow(color: .black.opacity(0.3), radius: 0, y: 4)
                
                Image(image)
                    .resizable()
                    .frame(width: sizeImage, height: sizeImage)
                    .offset(x: offsetXImage ,y: -6)
                
                Text(text)
                    .font(.custom("Ponytail", size: textSize))
                    .foregroundColor(.white)
                    .offset(y: 16)
            }
        }
    }
}

struct SettingsButton: View {
    var action: () -> Void
    var text: String
    var sizeHImage: CGFloat
    var sizeWImage: CGFloat
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.backForSoundButton)
                    .resizable()
                    .frame(width: sizeWImage, height: sizeHImage)
                
                Text(text)
                    .Ponytail(size: 20)
            }
        }
    }
}

struct PickImages: View {
    @State private var selectedItem: PhotosPickerItem? = nil
    @State private var selectedImage: Image? = nil
    var body: some View {
        PhotosPicker(
            selection: $selectedItem,
            matching: .images,
            photoLibrary: .shared()) {
                if let selectedImage = selectedImage {
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
            .onChange(of: selectedItem) { oldItem, newItem in
                guard let newItem else { return }
                Task {
                    if let data = try? await newItem.loadTransferable(type: Data.self),
                       let uiImage = UIImage(data: data) {
                        selectedImage = Image(uiImage: uiImage)
                    }
                }
            }
    }
}

struct CustomTextEditor: View {
    @State var text = "Name category here..."
    var size: CGFloat = 20
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .font(.custom("Ribik", size: size))
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
                    text = ""
                }
            }
    }
}

struct CustomSmallTextEditor: View {
    @State var text = "Write ingridients here..."
    var size: CGFloat = 15
    var body: some View {
        TextEditor(text: $text)
            .padding()
            .font(.custom("Ribik", size: size))
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
                    text = ""
                }
            }
    }
}

struct SimpleButton: View {
    var action: () -> Void
    var text: String
    var body: some View {
        Button(action: {
            action()
        }) {
            ZStack {
                Image(.backForSoundButton)
                    .resizable()
                    .frame(width: 130, height: 69)
                
                Text(text)
                    .Ponytail(size: 20)
            }
        }
    }
}

struct AchievementsIsDone: View {
    var text: String
    var image: String
    var body: some View {
        HStack {
            ZStack {
                Image(.backForAchievements)
                    .resizable()
                    .frame(width: 264, height: 88)
                
                Text(text)
                    .Ponytail(size: 18)
            }
            Spacer()
            
            ZStack {
                Image(.roundBack)
                    .resizable()
                    .frame(width: 65, height: 65)
                    
                Image(image)
                    .resizable()
                    .frame(width: 30, height: 30)
                    .offset(y: -4)
            }
            .offset(y: 2)
            .padding(.trailing, 20)
        }
        .padding(.leading)
    }
}
