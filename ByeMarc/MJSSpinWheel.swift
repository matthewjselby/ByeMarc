//
//  MJSSpinWheel.swift
//  ByeMarc
//
//  Created by Matthew Selby on 12/20/16.
//  Copyright © 2016 Matthew Selby. All rights reserved.
//

import UIKit

class MJSSpinWheel: UIView {

    let colors: [UIColor] = [UIColor.red, UIColor.blue, UIColor.yellow, UIColor.orange, UIColor.purple, UIColor.green, UIColor.magenta, UIColor.cyan]
    
    
    
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        
        //// Oval Drawing
        let numberOfSegments = 8
        for circleSegmentIndex in 0...numberOfSegments-1 {
            let segmentWidth: CGFloat = 360/CGFloat(numberOfSegments)
            let segmentStart: CGFloat = CGFloat(circleSegmentIndex) * segmentWidth - segmentWidth/2
            let segmentEnd: CGFloat = CGFloat(circleSegmentIndex) * segmentWidth + segmentWidth/2
            let ovalRect = CGRect(x: 12.5, y: 12.5, width: 300, height: 300)
            let ovalPath = UIBezierPath()
            ovalPath.addArc(withCenter: CGPoint(x: ovalRect.midX, y: ovalRect.midY), radius: ovalRect.width / 2, startAngle: segmentStart * CGFloat.pi/180, endAngle: segmentEnd * CGFloat.pi/180, clockwise: true)
            ovalPath.addLine(to: CGPoint(x: ovalRect.midX, y: ovalRect.midY))
            ovalPath.close()
            
            let segmentColor = colors[circleSegmentIndex]
            segmentColor.setFill()
            ovalPath.fill()
            
        }
        
    }

}
