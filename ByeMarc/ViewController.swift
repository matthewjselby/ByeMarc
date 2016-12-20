//
//  ViewController.swift
//  ByeMarc
//
//  Created by Matthew Selby on 12/20/16.
//  Copyright © 2016 Matthew Selby. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    let synth = AVSpeechSynthesizer()
    var selectedIndex: Int = 0
    let goodByePhrases: [String] = ["Goodbye Marc", "Cya later", "Well...bye", "I'm outta here", "Later bro", "Later alligator", "Peace out", "Bye"]

    @IBOutlet var goodByePhraseLabel: UILabel?
    @IBOutlet var spinWheelView: UIView?
    @IBOutlet var spinWheelPointerView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        goodByePhraseLabel!.text = ""
        spinWheelPointerView!.backgroundColor = UIColor.init(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        let spinWheelTextView = MJSSpinWheelText(frame: spinWheelView!.frame)
        spinWheelTextView.backgroundColor = UIColor.init(colorLiteralRed: 1.0, green: 1.0, blue: 1.0, alpha: 0.0)
        spinWheelTextView.center = (CGPoint(x: spinWheelView!.bounds.size.width/2, y: spinWheelView!.bounds.size.height/2))
        spinWheelView!.addSubview(spinWheelTextView)
        spinWheelView!.bringSubview(toFront: spinWheelTextView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func swipeOccurred() {
        let randomNumber = getRandomNumber()
        print(randomNumber)
        for _ in 1...5 {
            UIView.animate(withDuration: 0.5, animations: {
                self.spinWheelView!.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI))
                self.spinWheelView!.transform = CGAffineTransform(rotationAngle: CGFloat(M_PI*2))
            })
        }
        UIView.animate(withDuration: 0.5, animations: {
            let randomRotation = CGFloat(randomNumber) * CGFloat(M_PI_4)
            self.spinWheelView!.transform = CGAffineTransform(rotationAngle: randomRotation)
        })
        let selectedGoodByePhrase = goodByePhrases[Int(randomNumber)]
        self.goodByePhraseLabel!.text = selectedGoodByePhrase
        let myUtterance = AVSpeechUtterance(string: selectedGoodByePhrase)
        myUtterance.rate = 0.5
        synth.speak(myUtterance)
    }
    
    func getRandomNumber() -> Int {
        var randomNumber = arc4random_uniform(7)
        while selectedIndex == Int(randomNumber) {
            randomNumber = arc4random_uniform(7)
        }
        selectedIndex = Int(randomNumber)
        return Int(randomNumber)
    }
    
}

