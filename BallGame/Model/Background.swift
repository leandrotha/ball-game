//
//  Background.swift
//  BallGame
//
//  Created by Bartsch Tha, Leandro on 14/04/21.
//

import SpriteKit

class Background: SKSpriteNode {
    init(withOrigin origin: CGPoint) {
        let texture = SKTexture(imageNamed: "background")
        super.init(texture: texture, color: .clear, size: texture.size())
        
        position = origin
        zPosition = -1
    }
        
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
