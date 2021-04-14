//
//  CGSize + Extension.swift
//  BallGame
//
//  Created by Bartsch Tha, Leandro on 14/04/21.
//

import UIKit

extension CGSize {
    static func / (_ lhs: CGSize, _ rhs: CGFloat) -> CGSize {
        return CGSize(width: lhs.width / rhs, height: lhs.height / rhs)
    }
}
