//
//  Ball.swift
//  BallGame
//
//  Created by Bartsch Tha, Leandro on 14/04/21.
//

import SpriteKit

//MARK: - Custom properties

enum BallColor: String {
    case yellow
    case green
    case cyan
    case blue
    case purple
    case red
    case grey
}

class Ball: SKSpriteNode {
    
    //MARK: - Properties
    
    var ballColor: BallColor = .green {
        didSet (newValue) {
            texture = newValue.texture
        }
    }
    
    //MARK: - Lifecycle
    
    init(withOrigin origin: CGPoint) {
        let texture = ballColor.texture
        let size = texture.size()
        super.init(texture: texture, color: .clear, size: size)
        
        let dynamicOrigin = origin.y + (size.height / 2)
       
        position = CGPoint(x: origin.x, y: dynamicOrigin)
        zPosition = 1000
        
        physicsBody = SKPhysicsBody(circleOfRadius: frame.width / 2)
        physicsBody?.affectedByGravity = true
        physicsBody?.allowsRotation = false
        physicsBody?.restitution = 0.2
        physicsBody?.friction = 0.05
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Extensios

extension BallColor {
    var texture: SKTexture {
        get { return SKTexture(imageNamed: "ball-image-\(self)") }
    }
}
