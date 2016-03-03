//
//  ViewController.swift
//  UIConpoments
//
//  Created by Automan on 3/3/16.
//  Copyright © 2016 Automan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let screen = UIScreen.mainScreen().bounds
    let diameter: CGFloat = 88
    var target: CGFloat = 8
    var current: CGFloat = 0
    var currentCount: CGFloat = 0
    var checkInBtn: ButtonCheckIn?
    let reset = UIButton()
    let titleDrink = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        checkInBtn = ButtonCheckIn()
        reset(nil)
        checkInBtn!.frame.origin = CGPoint(x: (screen.width - checkInBtn!.frame.size.width) / 2, y: (screen.height - checkInBtn!.frame.size.width) / 2)
        checkInBtn!.addTarget(self, action: "count", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(checkInBtn!)
        
        reset.frame = CGRectMake(0, screen.height - 50, screen.width, 50)
        reset.backgroundColor = UIColor.blackColor()
        reset.setTitle("重置", forState: UIControlState.Normal)
        reset.addTarget(self, action: "reset:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(reset)
        
        titleDrink.font.fontWithSize(17)
        titleDrink.frame = CGRectMake(0, 100, screen.width, 17)
        titleDrink.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleDrink)
    }
    
    func reset(sender: UIButton?) {
        checkInBtn!.buildBtn(self.target, current: self.current, diameter: 88, step: true)
        currentCount = 0
        titleText()
    }
    
    func count() {
        if currentCount < target {
            currentCount += 1
            titleText()
        }
    }
    
    func titleText() {
        titleDrink.text = "每日\(currentCount)/\(target)杯水"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

