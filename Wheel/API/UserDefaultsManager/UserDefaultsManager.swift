import Foundation

enum Keys: String {
    case allRecept = "allRecept"
    case isFirstLaunch = "isFirstLaunch"
    case lastLaunchGame = "lastLaunchGame"
    case isTimeStarted = "isTimeStarted"
    case countOfMiniGamePlayed = "countOfMiniGamePlayed"
    case wheel = "wheel"
    case dice = "dice"
    case category = "category"
    case countOfCategory = "countOfCategory"
    case selfMadeRecipe = "selfMadeRecipe"
    case countOfSelfMadeRecipe = "countOfselfMadeRecipe"
    case level = "level"
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    let allArray = [[Item(name: "Strawberry Chocolate Cream",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 1 tbsp gelatin, 100g dark chocolate.",
                          recept: "Melt the dark chocolate and set aside. Whip the cream with sugar. Dissolve the gelatin in a small amount of water and add to the cream. Puree the strawberries and add to the cream mixture along with the melted chocolate. Mix well and chill in the refrigerator.",
                          image: ImageName.smallChocolateImages.rawValue,
                          detailImage: ImageName.detailChocolate1.rawValue,
                          isRecipeOfMounth: true),
                     Item(name: "Strawberry Chocolate Mousse",
                          ingredients: "300g strawberries, 200ml cream, 50g sugar, 100g dark chocolate.",
                          recept: "Melt the dark chocolate. Puree the strawberries and mix with sugar. Whip the cream and gently mix with the strawberry mixture and melted chocolate. Pour into glasses and chill.",
                          image: ImageName.smallChocolateImages1.rawValue,
                          detailImage: ImageName.detailChocolate2.rawValue,
                          isRecipeOfMounth: true),
                     Item(name: "Strawberry Chocolate Pie",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 200g flour, 100g butter, 100g dark chocolate.",
                          recept: "Melt the dark chocolate. Mix flour, sugar, and butter. Add cream, strawberries, and melted chocolate. Pour the batter into a pan. Bake at 180°C for 30 minutes.",
                          image: ImageName.smallChocolateImages2.rawValue,
                          detailImage: ImageName.detailChocolate3.rawValue,
                          isRecipeOfMounth: true),
                     Item(name: "Strawberry Chocolate Pudding",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 1 tbsp gelatin, 100g dark chocolate.",
                          recept: "Melt the dark chocolate. Dissolve the gelatin in a small amount of water. Whip the cream with sugar and add the gelatin. Puree the strawberries and add to the cream mixture along with the melted chocolate. Mix well and chill in the refrigerator.",
                          image: ImageName.smallChocolateImages3.rawValue,
                          detailImage: ImageName.detailChocolate4.rawValue,
                          isRecipeOfMounth: true),
                     Item(name: "Strawberry Chocolate Cheesecake",
                          ingredients: "200g strawberries, 200ml cream, 200g cream cheese, 100g sugar, 100g dark chocolate.",
                          recept: "Melt the dark chocolate. Mix cream cheese with sugar. Whip the cream and add to the cheese mixture. Puree the strawberries and add to the mixture along with the melted chocolate. Mix well and pour into a pan. Chill in the refrigerator.",
                          image: ImageName.smallChocolateImages4.rawValue,
                          detailImage: ImageName.detailChocolate5.rawValue,
                          isRecipeOfMounth: true)],
                    
                    [Item(name: "Pink Strawberry Cream",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 1 tbsp gelatin, pink food coloring.",
                          recept: "Whip the cream with sugar. Dissolve the gelatin in a small amount of water and add to the cream. Puree the strawberries and add to the cream mixture. Add pink food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallImage.rawValue,
                          detailImage: ImageName.detailPink1.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Strawberry Mousse with Pink Petals",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 200g flour, 100g butter, pink food coloring.",
                          recept: "Mix flour, sugar, and butter. Add cream and strawberries. Add pink food coloring and pour the batter into a pan. Bake at 180°C for 30 minutes.",
                          image: ImageName.smallImage2.rawValue,
                          detailImage: ImageName.detailPink2.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Pink Strawberry Pie",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 200g flour, 100g butter, pink food coloring.",
                          recept: "Mix flour, sugar, and butter. Add cream and strawberries. Add pink food coloring and pour the batter into a pan. Bake at 180°C for 30 minutes.",
                          image: ImageName.smallImage3.rawValue,
                          detailImage: ImageName.detailPink3.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Strawberry Pink Pudding",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 1 tbsp gelatin, pink food coloring.",
                          recept: "Dissolve the gelatin in a small amount of water. Whip the cream with sugar and add the gelatin. Puree the strawberries and add to the cream mixture. Add pink food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallImage4.rawValue,
                          detailImage: ImageName.detailPink4.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Pink Strawberry Cheesecake",
                          ingredients: "200g strawberries, 200ml cream, 200g cream cheese, 100g sugar, pink food coloring.",
                          recept: "Mix cream cheese with sugar. Whip the cream and add to the cheese mixture. Puree the strawberries and add to the mixture. Add pink food coloring and mix. Pour into a pan and chill in the refrigerator.",
                          image: ImageName.smallImage5.rawValue,
                          detailImage: ImageName.detailPink5.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Strawberry Pink Creme Brulee",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 2 eggs, pink food coloring.",
                          recept: "Whip the eggs with sugar. Add the cream and pureed strawberries. Add pink food coloring and mix. Pour into ramekins and bake at 180°C for 20 minutes. Chill and caramelize the top with sugar.",
                          image: ImageName.smallImage6.rawValue,
                          detailImage: ImageName.detailPink6.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Pink Strawberry Parade",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, pink food coloring.",
                          recept: "Whip the cream with sugar. Puree the strawberries and add to the cream mixture. Add pink food coloring and mix. Pour into glasses and chill in the refrigerator.",
                          image: ImageName.smallImage7.rawValue,
                          detailImage: ImageName.detailPink7.rawValue,
                          isRecipeOfMounth: false)],
                    
                    [Item(name: "Purple Strawberry Orange Cream",
                          ingredients: " 100g strawberries, 100g oranges, 200ml cream, 100g sugar, 1 tbsp gelatin, purple food coloring.",
                          recept: "Whip the cream with sugar. Dissolve the gelatin in a small amount of water and add to the cream. Puree the strawberries and oranges and add to the cream mixture. Add purple food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallPurpleImages.rawValue,
                          detailImage: ImageName.detailPuple1.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Strawberry Orange Mousse",
                          ingredients: "150g strawberries, 150g oranges, 200ml cream, 50g sugar, purple berries for decoration.",
                          recept: "Puree the strawberries and oranges and mix with sugar. Whip the cream and gently mix with the fruit mixture. Pour into glasses and decorate with purple berries.",
                          image: ImageName.smallPurpleImages2.rawValue,
                          detailImage: ImageName.detailPuple2.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Purple Strawberry Orange Pie",
                          ingredients: "100g strawberries, 100g oranges, 200ml cream, 100g sugar, 1 tbsp gelatin, purple food coloring.",
                          recept: "Mix flour, sugar, and butter. Add cream, strawberries, and oranges. Add purple food coloring and pour the batter into a pan. Bake at 180°C for 30 minutes.",
                          image: ImageName.smallPurpleImages3.rawValue,
                          detailImage: ImageName.detailPuple3.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Strawberry Orange Purple Pudding",
                          ingredients: "100g strawberries, 100g oranges, 200ml cream, 100g sugar, 1 tbsp gelatin, purple food coloring.",
                          recept: "Dissolve the gelatin in a small amount of water. Whip the cream with sugar and add the gelatin. Puree the strawberries and oranges and add to the cream mixture. Add purple food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallPurpleImages4.rawValue,
                          detailImage: ImageName.detailPuple4.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Purple Strawberry Orange Cheesecake",
                          ingredients: " 100g strawberries, 100g oranges, 200ml cream, 200g cream cheese, 100g sugar, purple food coloring.",
                          recept: "Mix cream cheese with sugar. Whip the cream and add to the cheese mixture. Puree the strawberries and oranges and add to the mixture. Add purple food coloring and mix. Pour into a pan and chill in the refrigerator.",
                          image: ImageName.smallPurpleImages5.rawValue,
                          detailImage: ImageName.detailPuple5.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Strawberry Orange Purple Creme Brulee",
                          ingredients: "100g strawberries, 100g oranges, 200ml cream, 100g sugar, 2 eggs, purple food coloring.",
                          recept: "Whip the eggs with sugar. Add the cream and pureed strawberries and oranges. Add purple food coloring and mix. Pour into ramekins and bake at 180°C for 20 minutes. Chill and caramelize the top with sugar.",
                          image: ImageName.smallPurpleImages6.rawValue,
                          detailImage: ImageName.detailPuple6.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Purple Strawberry Orange Parade",
                          ingredients: "100g strawberries, 100g oranges, 200ml cream, 100g sugar, purple food coloring.",
                          recept: "Whip the cream with sugar. Puree the strawberries and oranges and add to the cream mixture. Add purple food coloring and mix. Pour into glasses and chill in the refrigerator.",
                          image: ImageName.smallPurpleImages7.rawValue,
                          detailImage: ImageName.detailPuple7.rawValue,
                          isRecipeOfMounth: false)],
                    
                    [Item(name: "Orange Mandarin Cream",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, 1 tbsp gelatin, orange food coloring.",
                          recept: "Whip the cream with sugar. Dissolve the gelatin in a small amount of water and add to the cream. Puree the mandarins and add to the cream mixture. Add orange food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallOrangeImages.rawValue,
                          detailImage: ImageName.detailOrange1.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Mandarin Mousse with Orange Slices",
                          ingredients: "300g mandarins, 200ml cream, 50g sugar, orange slices for decoration.",
                          recept: "Puree the mandarins and mix with sugar. Whip the cream and gently mix with the mandarin mixture. Pour into glasses and decorate with orange slices.",
                          image: ImageName.smallOrangeImages2.rawValue,
                          detailImage: ImageName.detailOrange2.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Orange Mandarin Pie",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, 200g flour, 100g butter, orange food coloring.",
                          recept: "Mix flour, sugar, and butter. Add cream and mandarins. Add orange food coloring and pour the batter into a pan. Bake at 180°C for 30 minutes.",
                          image: ImageName.smallOrangeImages3.rawValue,
                          detailImage: ImageName.detailOrange3.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Mandarin Orange Pudding",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, 1 tbsp gelatin, orange food coloring.",
                          recept: "Dissolve the gelatin in a small amount of water. Whip the cream with sugar and add the gelatin. Puree the mandarins and add to the cream mixture. Add orange food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallOrangeImages4.rawValue,
                          detailImage: ImageName.detailOrange4.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Orange Mandarin Cheesecake",
                          ingredients: "200g mandarins, 200ml cream, 200g cream cheese, 100g sugar, orange food coloring.",
                          recept: "Mix cream cheese with sugar. Whip the cream and add to the cheese mixture. Puree the mandarins and add to the mixture. Add orange food coloring and mix. Pour into a pan and chill in the refrigerator.",
                          image: ImageName.smallOrangeImages5.rawValue,
                          detailImage: ImageName.detailOrange5.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Mandarin Orange Creme Brulee",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, 2 eggs, orange food coloring.",
                          recept: "Whip the eggs with sugar. Add the cream and pureed mandarins. Add orange food coloring and mix. Pour into ramekins and bake at 180°C for 20 minutes. Chill and caramelize the top with sugar.",
                          image: ImageName.smallOrangeImages6.rawValue,
                          detailImage: ImageName.detailOrange6.rawValue,
                          isRecipeOfMounth: false),
                     Item(name: "Orange Mandarin Parade",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, orange food coloring.",
                          recept: "Whip the cream with sugar. Puree the mandarins and add to the cream mixture. Add orange food coloring and mix. Pour into glasses and chill in the refrigerator.",
                          image: ImageName.smallOrangeImages7.rawValue,
                          detailImage: ImageName.detailOrange7.rawValue,
                          isRecipeOfMounth: false)]]
    
    let categoryArray = [CategoryModel(nameCategory: "Pink"), CategoryModel(nameCategory: "Purple"), CategoryModel(nameCategory: "Orange")]
    
    let selfRecipes = [Item(name: "Recipe 1",
                            ingredients: "200g mandarins, 200ml cream, 100g sugar, orange food coloring.",
                            recept: "Whip the cream with sugar. Puree the mandarins and add to the cream mixture. Add orange food coloring and mix. Pour into glasses and chill in the refrigerator.",
                            image: ImageName.smallOrangeImages7.rawValue,
                            detailImage: ImageName.detailOrange7.rawValue,
                            isRecipeOfMounth: false)]
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.bool(forKey: Keys.isFirstLaunch.rawValue) == false {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(categoryArray) {
                UserDefaultsManager.defaults.set(encoded, forKey: Keys.category.rawValue)
            }
            
            if let encoded = try? encoder.encode(selfRecipes) {
                UserDefaultsManager.defaults.set(encoded, forKey: Keys.selfMadeRecipe.rawValue)
            }
            
            if let encoded = try? encoder.encode(allArray) {
                UserDefaultsManager.defaults.set(encoded, forKey: Keys.allRecept.rawValue)
                UserDefaultsManager.defaults.set(1, forKey: Keys.countOfMiniGamePlayed.rawValue)
                UserDefaultsManager.defaults.set(1, forKey: Keys.wheel.rawValue)
                UserDefaultsManager.defaults.set(1, forKey: Keys.dice.rawValue)
                UserDefaultsManager.defaults.set(1, forKey: Keys.countOfCategory.rawValue)
                UserDefaultsManager.defaults.set(1, forKey: Keys.countOfSelfMadeRecipe.rawValue)
                UserDefaultsManager.defaults.set(1, forKey: Keys.level.rawValue)
            }
            UserDefaultsManager.defaults.set(true, forKey: Keys.isFirstLaunch.rawValue)
        }
    }
    
    func updateItem(_ item: Item, with newValue: Bool) {
        var loadedItems = loadAllRecept()
        for (indexCollection, collection) in loadedItems.enumerated() {
            if let indexItem = collection.firstIndex(where: { $0.name == item.name }) {
                var changedItem = collection[indexItem]
                changedItem.isRecipeOfMounth = newValue
                loadedItems[indexCollection][indexItem] = changedItem
                saveAllRecept(loadedItems)
                saveCurrentTime()
                addLevel()
                addTimeMiniGamePlayed()
                return
            }
        }
    }
    
    func checkIfDayPassed() -> Bool {
        if UserDefaultsManager.defaults.bool(forKey: Keys.isTimeStarted.rawValue) {
            if let lastLaunchDateString = UserDefaultsManager.defaults.string(forKey: Keys.lastLaunchGame.rawValue) {
                let dateFormatter = DateFormatter()
                dateFormatter.dateFormat = "yyyy-MM-dd"
                
                if let lastLaunchDate = dateFormatter.date(from: lastLaunchDateString) {
                    let calendar = Calendar.current
                    let components = calendar.dateComponents([.day], from: lastLaunchDate, to: Date())
                    
                    if let dayDifference = components.day, dayDifference >= 1 {
                        saveCurrentTime()
                        return true
                    }
                }
            }
            return false
        } else {
            return true
        }
    }
    
    func saveCurrentTime() {
        let currentTime = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        let dateString = dateFormatter.string(from: currentTime)
        UserDefaultsManager.defaults.set(true, forKey: Keys.isTimeStarted.rawValue)
        UserDefaultsManager.defaults.set(dateString, forKey: Keys.lastLaunchGame.rawValue)
    }
    
    func saveAllRecept(_ items: [[Item]]) {
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(items)
            UserDefaultsManager.defaults.set(data, forKey: Keys.allRecept.rawValue)
        } catch {
            print("Ошибка при сохранении: \(error)")
        }
    }
    
    func loadAllRecept() -> [[Item]]  {
        if let savedCategoriesData =  UserDefaultsManager.defaults.data(forKey: Keys.allRecept.rawValue) {
            let decoder = JSONDecoder()
            if let loadedCategories = try? decoder.decode([[Item]].self, from: savedCategoriesData) {
                return loadedCategories
            }
        }
        return []
    }
    
    func addLevel() {
        let currentTimes = UserDefaultsManager.defaults.object(forKey: Keys.level.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(currentTimes + 1, forKey: Keys.level.rawValue)
    }
    
    func getRecipesOfMounth() -> [Item] {
        return loadAllRecept()
            .flatMap { $0 }
            .filter { $0.isRecipeOfMounth }
    }
    
    func addTimeMiniGamePlayed() {
        let currentTimes = UserDefaultsManager.defaults.object(forKey: Keys.countOfMiniGamePlayed.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(currentTimes + 1, forKey: Keys.countOfMiniGamePlayed.rawValue)
    }
    
    func addWheelPlayed() {
        let currentTimes = UserDefaultsManager.defaults.object(forKey: Keys.wheel.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(currentTimes + 1, forKey: Keys.wheel.rawValue)
    }
    
    func addDicePlayed() {
        let currentTimes = UserDefaultsManager.defaults.object(forKey: Keys.dice.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(currentTimes + 1, forKey: Keys.dice.rawValue)
    }
    
    func loadAllCategory() -> [CategoryModel]  {
        if let savedCategoriesData =  UserDefaultsManager.defaults.data(forKey: Keys.category.rawValue) {
            let decoder = JSONDecoder()
            if let loadedCategories = try? decoder.decode([CategoryModel].self, from: savedCategoriesData) {
                return loadedCategories
            }
        }
        return []
    }
    
    func saveNewCategory(_ newCategory: CategoryModel) {
        var loadedCategories = loadAllCategory()
        loadedCategories.append(newCategory)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(loadedCategories)
            UserDefaultsManager.defaults.set(data, forKey: Keys.category.rawValue)
            print("Новая категория добавлена и сохранена")
        } catch {
            print("Ошибка при сохранении: \(error)")
        }
    }
    
    func addCategoryCount() {
        let currentTimes = UserDefaultsManager.defaults.object(forKey: Keys.countOfCategory.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(currentTimes + 1, forKey: Keys.countOfCategory.rawValue)
    }
    
    func loadSelfRecipes() -> [Item]  {
        if let savedCategoriesData =  UserDefaultsManager.defaults.data(forKey: Keys.selfMadeRecipe.rawValue) {
            let decoder = JSONDecoder()
            if let loadedCategories = try? decoder.decode([Item].self, from: savedCategoriesData) {
                return loadedCategories
            }
        }
        return []
    }
    
    func saveNewSelfRecipes(_ newRecipe: Item) {
        var loadedRecipes = loadSelfRecipes()
        loadedRecipes.append(newRecipe)
        
        do {
            let encoder = JSONEncoder()
            let data = try encoder.encode(loadedRecipes)
            UserDefaultsManager.defaults.set(data, forKey: Keys.selfMadeRecipe.rawValue)
            print("Новый рецепт добавлен и сохранен")
        } catch {
            print("Ошибка при сохранении: \(error)")
        }
    }
    
    func addRecipesCount() {
        let currentTimes = UserDefaultsManager.defaults.object(forKey: Keys.countOfSelfMadeRecipe.rawValue) as? Int ?? 0
        UserDefaultsManager.defaults.set(currentTimes + 1, forKey: Keys.countOfSelfMadeRecipe.rawValue)
    }
}
