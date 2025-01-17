import SwiftUI

struct LastReciple {
    var nameOfRecipe: String
    var imageOfRecipe: String
}

struct CategoryModel: Codable, Hashable {
    var nameCategory: String
    var imageOfCategory: String = ImageName.profileRectangle.rawValue
}

struct ProfileModel {
    let nameOfArrays = ["Your categories", "Your last wheel recipe", "Your self-made recipe"]
    let lastRecipeArray = [LastReciple(nameOfRecipe: "Pink Strawberry Cream", imageOfRecipe: ImageName.wheelRecept1.rawValue),
                           LastReciple(nameOfRecipe: "Strawberry Mousse with Pink Petals", imageOfRecipe: ImageName.wheelRecept2.rawValue),
                           LastReciple(nameOfRecipe: "Pink Strawberry Pie", imageOfRecipe: ImageName.wheelRecept3.rawValue)]
    let selfMadeRecipe = ["Recipe 1", "Recipe 2", "Recipe 3", "Recipe 4"]
}


