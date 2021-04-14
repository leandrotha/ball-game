//
//  CGFloat + Extensions.swift
//  BallGame
//
//  Created by Bartsch Tha, Leandro on 14/04/21.
//

import UIKit

extension CGFloat {
    var radians: CGFloat {
        get { return self * CGFloat.pi / 180 }
    }
}
