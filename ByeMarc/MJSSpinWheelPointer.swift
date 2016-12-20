//
//  MJSSpinWheelPointer.swift
//  ByeMarc
//
//  Created by Matthew Selby on 12/20/16.
//  Copyright © 2016 Matthew Selby. All rights reserved.
//

import UIKit

class MJSSpinWheelPointer: UIView {

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        //// Bezier Drawing
        let bezierPath = UIBezierPath()
        bezierPath.move(to: CGPoint(x: 299.5, y: 163))
        bezierPath.addLine(to: CGPoint(x: 318.5, y: 157.5))
        bezierPath.addLine(to: CGPoint(x: 318.5, y: 168.5))
        bezierPath.addLine(to: CGPoint(x: 299.5, y: 163))
        bezierPath.close()
        UIColor.black.setFill()
        bezierPath.fill()
        UIColor.black.setStroke()
        bezierPath.lineWidth = 1
        bezierPath.stroke()
    }

}
