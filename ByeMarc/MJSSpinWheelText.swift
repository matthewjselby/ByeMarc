//
//  MJSSpinWheelText.swift
//  ByeMarc
//
//  Created by Matthew Selby on 12/20/16.
//  Copyright © 2016 Matthew Selby. All rights reserved.
//

import UIKit
import Foundation

class MJSSpinWheelText: UIView {
    
    let goodByePhrases: [String] = ["Goodbye Marc", "Cya later", "Well...bye", "I'm outta here", "Later bro", "Later alligator", "Peace out", "Bye"]

    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        let numberOfSegments = 8
        for circleSegmentIndex in 0...numberOfSegments-1 {
            let segmentWidth: CGFloat = 360/CGFloat(numberOfSegments)
            let segmentMiddle: CGFloat = CGFloat(circleSegmentIndex) * segmentWidth
            let textLinePath = UIBezierPath()
            textLinePath.move(to: CGPoint(x: self.superview!.bounds.midX, y: self.superview!.bounds.midY))
            let opposite = sin((segmentMiddle + 90) * CGFloat(M_PI / 180)) * 150 + self.superview!.bounds.midY
            let adjacent = cos((segmentMiddle + 90) * CGFloat(M_PI / 180)) * 150 + self.superview!.bounds.midX
            textLinePath.addLine(to: CGPoint(x: opposite, y: adjacent))
            
            let textStyle = NSMutableParagraphStyle()
            textStyle.alignment = .center
            let attributedString = NSAttributedString(string: goodByePhrases[circleSegmentIndex], attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: UIFont.labelFontSize), NSForegroundColorAttributeName: UIColor.white, NSParagraphStyleAttributeName: textStyle])
            
            let textBezier = Bezier(path: textLinePath.cgPath)
            textBezier.draw(attributed: attributedString, to:UIGraphicsGetCurrentContext()!)
        
        }
        
    }

}
