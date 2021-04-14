//
//  Obstacle.swift
//  BallGame
//
//  Created by Bartsch Tha, Leandro on 14/04/21.
//

import SpriteKit

//MARK: - Custom properties

enum ObstacleOrientation {
    case up, down
}

class Obstacle: SKShapeNode {
    
    //MARK: - Properties
    
    private let orientation: ObstacleOrientation
    
    //MARK: - Initialization
    
    init(frame: CGRect, orientation: ObstacleOrientation) {
        self.orientation = orientation
        super.init()
        
        strokeColor = orientation == .down ? .green : .red
        lineWidth = 2
        
        let angles = getOriginAngles()
        let customPath = UIBezierPath(arcCenter: frame.origin, radius: frame.size.height / 2, startAngle: angles.start, endAngle: angles.end, clockwise: false)
        path = customPath.cgPath
        
        let physics = SKPhysicsBody(edgeChainFrom: path!)
        physicsBody = physics
        physicsBody?.affectedByGravity = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - Private Methods

extension Obstacle {
    private func getOriginAngles() -> (start: CGFloat, end: CGFloat) {
        if orientation == .up {
            return (CGFloat(83).radians, CGFloat(97).radians)
        } else {
            return (CGFloat(260).radians, CGFloat(280).radians)
        }
    }
}
