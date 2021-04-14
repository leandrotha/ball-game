//
//  Board.swift
//  BallGame
//
//  Created by Bartsch Tha, Leandro on 14/04/21.
//

import SpriteKit

class Board: SKShapeNode {
    func setupBoard(_ origin: CGPoint) {
        position = origin
        fillColor = .clear
        strokeColor = .black
        lineWidth = 2
        
        physicsBody = SKPhysicsBody(edgeLoopFrom: path!)
        physicsBody?.affectedByGravity = false
    }
    
    func getBottomEdge() -> CGPoint {
        let yCenter = parent!.frame.midY
        let xCenter = parent!.frame.midX
        let bottom = yCenter - frame.size.height / 2
        
        return CGPoint(x: xCenter, y: bottom)
    }
}
