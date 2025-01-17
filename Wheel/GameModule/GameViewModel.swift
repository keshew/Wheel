import SwiftUI

class GameViewModel: ObservableObject {
    let contact = GameModel()
    @Published var winningRecept = UserDefaultsManager().getRecipesOfMounth()
    
    func createDartsGameScene(gameData: GameData) -> GameSpriteKit {
        let scene = GameSpriteKit()
        scene.game  = gameData
        return scene
    }
}
