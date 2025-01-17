import SwiftUI
import SpriteKit

class GameData: ObservableObject {
    @Published var isWin = false
    @Published var timeLeft = 120
    @Published var score = 0
    @Published var isBack = false
}

class GameSpriteKit: SKScene, SKPhysicsContactDelegate {
    var game: GameData?
    var time: SKLabelNode!
    var score: SKLabelNode!
    var bug: SKSpriteNode!
    var timer: Timer?
    var node: SKSpriteNode!
    func setupView() {
        let gameBackground = SKSpriteNode(texture: SKTexture(imageNamed: ImageName.mainBackground.rawValue))
        gameBackground.size = CGSize(width: size.width, height: size.height)
        gameBackground.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground)
        
        let gameBackground2 = SKSpriteNode(texture: SKTexture(imageNamed: ImageName.shadowBackground.rawValue))
        gameBackground2.alpha = 0.8
        gameBackground2.size = CGSize(width: size.width, height: size.height)
        gameBackground2.position = CGPoint(x: size.width / 2, y: size.height / 2)
        addChild(gameBackground2)
        
        let backButton = SKSpriteNode(texture: SKTexture(imageNamed: ImageName.backForHomeButton.rawValue))
        backButton.name = "backButton"
        backButton.size = CGSize(width: size.width / 8, height: size.height / 17)
        backButton.position = CGPoint(x: size.width / 8, y: size.height / 1.15)
        addChild(backButton)
        
        let back = SKSpriteNode(texture: SKTexture(imageNamed: ImageName.backArrow.rawValue))
        back.size = CGSize(width: size.width / 12, height: size.height / 27)
        back.name = "back"
        back.position = CGPoint(x: size.width / 8.3, y: size.height / 1.141)
        addChild(back)
        
        let backLabel = SKLabelNode(fontNamed: "Ponytail")
        backLabel.text = "Back"
        backLabel.fontSize = 12
        backLabel.position = CGPoint(x: size.width / 8, y: size.height / 1.18)
        addChild(backLabel)
        
        let gameImage = SKSpriteNode(texture: SKTexture(imageNamed: ImageName.gameLabel.rawValue))
        gameImage.zPosition = 3
        gameImage.size = CGSize(width: size.width / 1.5, height: size.height / 8)
        gameImage.position = CGPoint(x: size.width / 2, y: size.height / 1.28)
        addChild(gameImage)
        
        time = SKLabelNode(fontNamed: "Ponytail")
        time.zPosition = 3
        time.attributedText = NSAttributedString(string:":\(String(describing: (game?.timeLeft ?? 0) / 60)):\(String(describing: (game?.timeLeft ?? 0) % 60))", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Ponytail", size: 40)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -2.5
        ])
        time.position = CGPoint(x: size.width / 1.35, y: size.height / 1.57)
        addChild(time)
        
        let timeLabel = SKLabelNode(fontNamed: "Ponytail")
        timeLabel.zPosition = 3
        timeLabel.attributedText = NSAttributedString(string:"Time", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Ponytail", size: 40)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -2.5
        ])
        timeLabel.position = CGPoint(x: size.width / 1.35, y: size.height / 1.47)
        addChild(timeLabel)
        
        score = SKLabelNode(fontNamed: "Ponytail")
        score.zPosition = 3
        score.attributedText = NSAttributedString(string:":\(String(describing: (game?.score ?? 0)))", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Ponytail", size: 40)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -2.5
        ])
        score.position = CGPoint(x: size.width / 4.2, y: size.height / 1.57)
        addChild(score)
        
        let scoreLabel = SKLabelNode(fontNamed: "Ponytail")
        scoreLabel.zPosition = 3
        scoreLabel.attributedText = NSAttributedString(string:"Score", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Ponytail", size: 40)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -2.5
        ])
        scoreLabel.position = CGPoint(x: size.width / 4, y: size.height / 1.47)
        addChild(scoreLabel)
        
        let levelLabel = SKLabelNode(fontNamed: "Ponytail")
        levelLabel.zPosition = 3
        levelLabel.attributedText = NSAttributedString(string:"LEVEL \(UserDefaultsManager.defaults.object(forKey: Keys.level.rawValue)!)", attributes: [
            NSAttributedString.Key.font: UIFont(name: "Ponytail", size: 54)!,
            NSAttributedString.Key.foregroundColor: UIColor.white,
            NSAttributedString.Key.strokeColor: UIColor.black,
            NSAttributedString.Key.strokeWidth: -2.5
        ])
        levelLabel.position = CGPoint(x: size.width / 2, y: size.height / 30)
        addChild(levelLabel)
        
        bug = SKSpriteNode(texture: SKTexture(imageNamed: ImageName.bug.rawValue))
        bug.zPosition = 3
        bug.physicsBody = SKPhysicsBody(rectangleOf: CGSize(width: 50, height: 10))
        bug.physicsBody?.isDynamic = true
        bug.physicsBody?.affectedByGravity = false
        bug.physicsBody?.contactTestBitMask = 3
        bug.physicsBody?.collisionBitMask = 0
        bug.physicsBody?.categoryBitMask = 5
        bug.name = "bug"
        bug.size = CGSize(width: size.width / 3, height: size.height / 6)
        bug.position = CGPoint(x: size.width / 2, y: size.height / 4.5)
        addChild(bug)
    }
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            self.updateTimer()
        }
    }
    
    func updateTimer() {
        if game?.timeLeft ?? 0 > 0 {
            game?.timeLeft -= 1
            time.attributedText = NSAttributedString(string:":\(String(describing: (game?.timeLeft ?? 0) / 60)):\(String(describing: (game?.timeLeft ?? 0) % 60))", attributes: [
                NSAttributedString.Key.font: UIFont(name: "Ponytail", size: 40)!,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.strokeWidth: -2.5
            ])
        } else {
            if game!.isWin == false {
                game!.isWin = true
                timer?.invalidate()
            }
        }
    }
    
    func createNode() -> SKSpriteNode {
        let node = SKSpriteNode(imageNamed: "candy")
        node.size = CGSize(width: 75, height: 65)
        node.physicsBody = SKPhysicsBody(rectangleOf: node.size)
        node.physicsBody?.isDynamic = false
        node.physicsBody?.contactTestBitMask = 5
        node.physicsBody?.categoryBitMask = 3
        node.zPosition = 1
        return node
    }
    
    func addNode() {
        node = createNode()
        node.position = CGPoint(x: CGFloat.random(in: 50...size.width - 50), y: size.height)
        addChild(node)
        let action = SKAction.moveBy(x: 0, y: -size.height, duration: 2)
        let sequence = SKAction.sequence([action, SKAction.removeFromParent()])
        if game!.isWin == false {
            node.run(sequence)
        } else {
            node.removeAllActions()
        }
    }
    
    func startAddingNodes() {
        let waitAction = SKAction.wait(forDuration: 1)
        let addNodeAction = SKAction.run { [weak self] in
            if self!.game!.isWin == false {
                self?.addNode()
            }
        }
        let sequence = SKAction.sequence([waitAction, addNodeAction])
        let repeatAction = SKAction.repeatForever(sequence)
        run(repeatAction)
    }
    
    override func didMove(to view: SKView) {
        scene?.size = UIScreen.main.bounds.size
        physicsWorld.contactDelegate = self
        setupView()
        startTimer()
        startAddingNodes()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else { return }
        let location = touch.location(in: self)
        let node = atPoint(location)
        
        if node.name == "back" && node.name != "backButton" {
            game?.isBack = true
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in touches {
            let location = touch.location(in: self)
            let node = atPoint(location)
            if node.name == "bug" {
                node.position.x = location.x
            }
        }
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        let bodyA = contact.bodyA
        let bodyB = contact.bodyB

        if bodyA.node?.name == "bug" && bodyB.node?.physicsBody?.categoryBitMask == 3 {
            bodyB.node?.removeFromParent()
            game?.score += 100
            score.attributedText = NSAttributedString(string:":\(String(describing: (game?.score ?? 0)))", attributes: [
                NSAttributedString.Key.font: UIFont(name: "Ponytail", size: 40)!,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.strokeWidth: -2.5
            ])
        }
        
        if bodyB.node?.name == "bug" && bodyA.node?.physicsBody?.categoryBitMask == 3 {
            bodyA.node?.removeFromParent()
            game?.score += 100
            score.attributedText = NSAttributedString(string:":\(String(describing: (game?.score ?? 0)))", attributes: [
                NSAttributedString.Key.font: UIFont(name: "Ponytail", size: 40)!,
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.strokeColor: UIColor.black,
                NSAttributedString.Key.strokeWidth: -2.5
            ])
        }
    }
}

struct GameView: View {
    @StateObject var gameModel =  GameViewModel()
    @StateObject var gameData =  GameData()
    @Binding var navigationPath: NavigationPath
    var body: some View {
        if gameData.isWin {
            ZStack {
                SpriteView(scene: gameModel.createDartsGameScene(gameData: gameData))
                    .ignoresSafeArea()
                    .navigationBarBackButtonHidden(true)
                
                RecipeView(recept: $gameModel.winningRecept.randomElement()!, navigationPath: $navigationPath)
            }
        } else {
            SpriteView(scene: gameModel.createDartsGameScene(gameData: gameData))
                .ignoresSafeArea()
                .navigationBarBackButtonHidden(true)
                .navigationDestination(isPresented: $gameData.isBack) {
                    HomeView(navigationPath: $navigationPath)
                }
        }
    }
}

#Preview {
    let navigationPath = NavigationPath()
    return GameView(navigationPath: .constant(navigationPath))
}

