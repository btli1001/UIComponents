//
//  ViewControllerNoneStep.swift
//  UIConpoments
//
//  Created by Automan on 3/3/16.
//  Copyright © 2016 Automan. All rights reserved.
//

import UIKit

class ViewControllerNoneStep: UIViewController {
    
    let screen = UIScreen.mainScreen().bounds
    let diameter: CGFloat = 88
    var target: CGFloat = 6000
    var current: CGFloat = 4000
    var checkInBtn: ButtonCheckIn?
    var titleSetp: UILabel?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        checkInBtn = ButtonCheckIn()
        checkInBtn!.buildBtn(self.target, current: self.current, diameter: 88, step: false)
        checkInBtn!.frame.origin = CGPoint(x: (screen.width - checkInBtn!.frame.size.width) / 2, y: (screen.height - checkInBtn!.frame.size.width) / 2)
        self.view.addSubview(checkInBtn!)
        
        titleSetp = UILabel(frame: CGRectMake(0,100,screen.width,17))
        titleSetp!.text = "当前步数\(current)步, 目标\(target)步"
        titleSetp!.textAlignment = NSTextAlignment.Center
        self.view.addSubview(titleSetp!)
        
        let button = UIButton(frame: CGRectMake(0,screen.height - 50, screen.width, 50))
        button.backgroundColor = UIColor.blackColor()
        button.setTitle("立刻到达步数", forState: UIControlState.Normal)
        button.addTarget(self, action: "done:", forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(button)
    }
    
    func done(sender: UIButton?) {
        current = target
        titleSetp?.text = "当前步数\(current)步, 目标\(target)步"
        checkInBtn!.buildBtn(self.target, current: self.current, diameter: 88, step: false)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
