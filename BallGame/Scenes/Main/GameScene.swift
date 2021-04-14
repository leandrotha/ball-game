//
//  GameScene.swift
//  BallGame
//
//  Created by Bartsch Tha, Leandro on 14/04/21.
//

import SpriteKit
import CoreMotion

class GameScene: SKScene {
    
    //MARK: - Properties
    
    lazy var board: Board = {
        let node = Board(circleOfRadius: frame.size.height / 2.1)
        let sceneCenter = CGPoint(x: frame.midX, y: frame.midY)
        node.setupBoard(sceneCenter)
        return node
    }()
    lazy var background: Background = {
        let sceneCenter = CGPoint(x: frame.midX, y: frame.midY)
        return Background(withOrigin: sceneCenter)
    }()
    lazy var ball: Ball = {
        return Ball(withOrigin: board.getBottomEdge())
    }()
    lazy var externalObstacle: Obstacle = {
        let sceneCenter = CGPoint(x: frame.midX, y: frame.midY)
        let rect = CGRect(origin: sceneCenter, size: frame.size / 1.35)
        let obstacle = Obstacle(frame: rect, orientation: .up)
        return obstacle
    }()
    lazy var internalObstacle: Obstacle = {
        let sceneCenter = CGPoint(x: frame.midX, y: frame.midY)
        let rect = CGRect(origin: sceneCenter, size: frame.size / 2)
        let obstacle = Obstacle(frame: rect, orientation: .down)
        return obstacle
    }()
    
    let motionManager = CMMotionManager()
    
    //MARK: - Lifecycle
    
    override func didMove(to view: SKView) {
        setupEnvironment()
    }
    
    override func update(_ currentTime: TimeInterval) {
        if let accelerometerData = motionManager.accelerometerData {
            physicsWorld.gravity = CGVector(dx: -accelerometerData.acceleration.y * 50, dy: accelerometerData.acceleration.x * 50)
        }
    }
}

//MARK: - Methods

extension GameScene {
    private func setupEnvironment() {
        addNodes()
        setupScene()
    }
    
    private func addNodes() {
        addChild(background)
        addChild(board)
        addChild(ball)
        addChild(externalObstacle)
        addChild(internalObstacle)
    }
    
    private func setupScene() {
        size = UIScreen.main.bounds.size
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: frame)
        physicsBody?.restitution = 0
        physicsBody?.friction = 0
        
        motionManager.startAccelerometerUpdates()
    }
}

//MARK: - Touch handler

extension GameScene {
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        let possibilityArray: [BallColor] = [.blue, .cyan, .green, .grey, .purple, .red, .yellow]
        ball.ballColor = possibilityArray.shuffled().first!
    }
}
