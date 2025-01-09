import SwiftUI

public struct Item: Codable, Hashable {
    var name: String
    var ingredients: String
    var recept: String
    var image: String
    var detailImage: String
}

struct HomeModel {
    let nameOfArrays = ["Pinky cakes", "Purple cakes", "Orange cakes"]
}
