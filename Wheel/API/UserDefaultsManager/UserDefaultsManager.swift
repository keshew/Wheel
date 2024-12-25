import Foundation

enum Keys: String {
    case allRecept = "allRecept"
}

class UserDefaultsManager {
    static let defaults = UserDefaults.standard
    
    let allArray = [[Item(name: "Pink Strawberry Cream",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 1 tbsp gelatin, pink food coloring.",
                          recept: "Whip the cream with sugar. Dissolve the gelatin in a small amount of water and add to the cream. Puree the strawberries and add to the cream mixture. Add pink food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallImage.rawValue,
                          detailImage: ImageName.detailPink1.rawValue),
                     Item(name: "Strawberry Mousse with Pink Petals",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 200g flour, 100g butter, pink food coloring.",
                          recept: "Mix flour, sugar, and butter. Add cream and strawberries. Add pink food coloring and pour the batter into a pan. Bake at 180°C for 30 minutes.",
                          image: ImageName.smallImage2.rawValue,
                          detailImage: ImageName.detailPink2.rawValue),
                     Item(name: "Pink Strawberry Pie",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 200g flour, 100g butter, pink food coloring.",
                          recept: "Mix flour, sugar, and butter. Add cream and strawberries. Add pink food coloring and pour the batter into a pan. Bake at 180°C for 30 minutes.",
                          image: ImageName.smallImage3.rawValue,
                          detailImage: ImageName.detailPink3.rawValue),
                     Item(name: "Strawberry Pink Pudding",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 1 tbsp gelatin, pink food coloring.",
                          recept: "Dissolve the gelatin in a small amount of water. Whip the cream with sugar and add the gelatin. Puree the strawberries and add to the cream mixture. Add pink food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallImage4.rawValue,
                          detailImage: ImageName.detailPink4.rawValue),
                     Item(name: "Pink Strawberry Cheesecake",
                          ingredients: "200g strawberries, 200ml cream, 200g cream cheese, 100g sugar, pink food coloring.",
                          recept: "Mix cream cheese with sugar. Whip the cream and add to the cheese mixture. Puree the strawberries and add to the mixture. Add pink food coloring and mix. Pour into a pan and chill in the refrigerator.",
                          image: ImageName.smallImage5.rawValue,
                          detailImage: ImageName.detailPink5.rawValue),
                     Item(name: "Strawberry Pink Creme Brulee",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, 2 eggs, pink food coloring.",
                          recept: "Whip the eggs with sugar. Add the cream and pureed strawberries. Add pink food coloring and mix. Pour into ramekins and bake at 180°C for 20 minutes. Chill and caramelize the top with sugar.",
                          image: ImageName.smallImage6.rawValue,
                          detailImage: ImageName.detailPink6.rawValue),
                     Item(name: "Pink Strawberry Parade",
                          ingredients: "200g strawberries, 200ml cream, 100g sugar, pink food coloring.",
                          recept: "Whip the cream with sugar. Puree the strawberries and add to the cream mixture. Add pink food coloring and mix. Pour into glasses and chill in the refrigerator.",
                          image: ImageName.smallImage7.rawValue,
                          detailImage: ImageName.detailPink7.rawValue)],
                    
                    [Item(name: "Purple Strawberry Orange Cream",
                          ingredients: " 100g strawberries, 100g oranges, 200ml cream, 100g sugar, 1 tbsp gelatin, purple food coloring.",
                          recept: "Whip the cream with sugar. Dissolve the gelatin in a small amount of water and add to the cream. Puree the strawberries and oranges and add to the cream mixture. Add purple food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallPurpleImages.rawValue,
                          detailImage: ImageName.detailPuple1.rawValue),
                     Item(name: "Strawberry Orange Mousse",
                          ingredients: "150g strawberries, 150g oranges, 200ml cream, 50g sugar, purple berries for decoration.",
                          recept: "Puree the strawberries and oranges and mix with sugar. Whip the cream and gently mix with the fruit mixture. Pour into glasses and decorate with purple berries.",
                          image: ImageName.smallPurpleImages2.rawValue,
                          detailImage: ImageName.detailPuple2.rawValue),
                     Item(name: "Purple Strawberry Orange Pie",
                          ingredients: "100g strawberries, 100g oranges, 200ml cream, 100g sugar, 1 tbsp gelatin, purple food coloring.",
                          recept: "Mix flour, sugar, and butter. Add cream, strawberries, and oranges. Add purple food coloring and pour the batter into a pan. Bake at 180°C for 30 minutes.",
                          image: ImageName.smallPurpleImages3.rawValue,
                          detailImage: ImageName.detailPuple3.rawValue),
                     Item(name: "Strawberry Orange Purple Pudding",
                          ingredients: "100g strawberries, 100g oranges, 200ml cream, 100g sugar, 1 tbsp gelatin, purple food coloring.",
                          recept: "Dissolve the gelatin in a small amount of water. Whip the cream with sugar and add the gelatin. Puree the strawberries and oranges and add to the cream mixture. Add purple food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallPurpleImages4.rawValue,
                          detailImage: ImageName.detailPuple4.rawValue),
                     Item(name: "Purple Strawberry Orange Cheesecake",
                          ingredients: " 100g strawberries, 100g oranges, 200ml cream, 200g cream cheese, 100g sugar, purple food coloring.",
                          recept: "Mix cream cheese with sugar. Whip the cream and add to the cheese mixture. Puree the strawberries and oranges and add to the mixture. Add purple food coloring and mix. Pour into a pan and chill in the refrigerator.",
                          image: ImageName.smallPurpleImages5.rawValue,
                          detailImage: ImageName.detailPuple5.rawValue),
                     Item(name: "Strawberry Orange Purple Creme Brulee",
                          ingredients: "100g strawberries, 100g oranges, 200ml cream, 100g sugar, 2 eggs, purple food coloring.",
                          recept: "Whip the eggs with sugar. Add the cream and pureed strawberries and oranges. Add purple food coloring and mix. Pour into ramekins and bake at 180°C for 20 minutes. Chill and caramelize the top with sugar.",
                          image: ImageName.smallPurpleImages6.rawValue,
                          detailImage: ImageName.detailPuple6.rawValue),
                     Item(name: "Purple Strawberry Orange Parade",
                          ingredients: "100g strawberries, 100g oranges, 200ml cream, 100g sugar, purple food coloring.",
                          recept: "Whip the cream with sugar. Puree the strawberries and oranges and add to the cream mixture. Add purple food coloring and mix. Pour into glasses and chill in the refrigerator.",
                          image: ImageName.smallPurpleImages7.rawValue,
                          detailImage: ImageName.detailPuple7.rawValue)],
                    
                    [Item(name: "Orange Mandarin Cream",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, 1 tbsp gelatin, orange food coloring.",
                          recept: "Whip the cream with sugar. Dissolve the gelatin in a small amount of water and add to the cream. Puree the mandarins and add to the cream mixture. Add orange food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallOrangeImages.rawValue,
                          detailImage: ImageName.detailOrange1.rawValue),
                     Item(name: "Mandarin Mousse with Orange Slices",
                          ingredients: "300g mandarins, 200ml cream, 50g sugar, orange slices for decoration.",
                          recept: "Puree the mandarins and mix with sugar. Whip the cream and gently mix with the mandarin mixture. Pour into glasses and decorate with orange slices.",
                          image: ImageName.smallOrangeImages2.rawValue,
                          detailImage: ImageName.detailOrange2.rawValue),
                     Item(name: "Orange Mandarin Pie",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, 200g flour, 100g butter, orange food coloring.",
                          recept: "Mix flour, sugar, and butter. Add cream and mandarins. Add orange food coloring and pour the batter into a pan. Bake at 180°C for 30 minutes.",
                          image: ImageName.smallOrangeImages3.rawValue,
                          detailImage: ImageName.detailOrange3.rawValue),
                     Item(name: "Mandarin Orange Pudding",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, 1 tbsp gelatin, orange food coloring.",
                          recept: "Dissolve the gelatin in a small amount of water. Whip the cream with sugar and add the gelatin. Puree the mandarins and add to the cream mixture. Add orange food coloring and mix. Chill in the refrigerator.",
                          image: ImageName.smallOrangeImages4.rawValue,
                          detailImage: ImageName.detailOrange4.rawValue),
                     Item(name: "Orange Mandarin Cheesecake",
                          ingredients: "200g mandarins, 200ml cream, 200g cream cheese, 100g sugar, orange food coloring.",
                          recept: "Mix cream cheese with sugar. Whip the cream and add to the cheese mixture. Puree the mandarins and add to the mixture. Add orange food coloring and mix. Pour into a pan and chill in the refrigerator.",
                          image: ImageName.smallOrangeImages5.rawValue,
                          detailImage: ImageName.detailOrange5.rawValue),
                     Item(name: "Mandarin Orange Creme Brulee",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, 2 eggs, orange food coloring.",
                          recept: "Whip the eggs with sugar. Add the cream and pureed mandarins. Add orange food coloring and mix. Pour into ramekins and bake at 180°C for 20 minutes. Chill and caramelize the top with sugar.",
                          image: ImageName.smallOrangeImages6.rawValue,
                          detailImage: ImageName.detailOrange6.rawValue),
                     Item(name: "Orange Mandarin Parade",
                          ingredients: "200g mandarins, 200ml cream, 100g sugar, orange food coloring.",
                          recept: "Whip the cream with sugar. Puree the mandarins and add to the cream mixture. Add orange food coloring and mix. Pour into glasses and chill in the refrigerator.",
                          image: ImageName.smallOrangeImages7.rawValue,
                          detailImage: ImageName.detailOrange7.rawValue)]]
    
    func firstLaunch() {
        if UserDefaultsManager.defaults.string(forKey: Keys.allRecept.rawValue) == nil {
            let encoder = JSONEncoder()
            if let encoded = try? encoder.encode(allArray) {
                UserDefaultsManager.defaults.set(encoded, forKey: Keys.allRecept.rawValue)
            }
        }
    }
    
    func loadAllRecept() -> [[Item]]  {
        if let savedCategoriesData = UserDefaults.standard.data(forKey: Keys.allRecept.rawValue) {
            let decoder = JSONDecoder()
            if let loadedCategories = try? decoder.decode([[Item]].self, from: savedCategoriesData) {
                return loadedCategories
            }
        }
        return []
    }
}