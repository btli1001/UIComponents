//
//  ButtonCheckIn.swift
//  UIConpoments
//
//  Created by Automan on 3/3/16.
//  Copyright © 2016 Automan. All rights reserved.
//

import UIKit

class ButtonCheckIn: UIButton {
    
    var target: CGFloat?
    var current: CGFloat?
    var setp = true
    var diameter: CGFloat = 87
    var centerPoint: CGPoint?
    let colorRed = UIColor(red: 1, green: 79/255, blue: 132/255, alpha: 1)
    let colorGreen = UIColor(red: 58/255, green: 203/255, blue: 210/255, alpha: 1)
    let colorGray = UIColor(red: 200/255, green: 200/255, blue: 200/255, alpha: 1)
    let strokeWidth: CGFloat = 3.5
    let strokeInsideWidth: CGFloat = 2.5
    let innerStrokeWidth: CGFloat = 5
    let strokeRed = CAShapeLayer()
    let strokeGreen = CAShapeLayer()
    let strokeAdd = "strokeAdd"
    let btnBg = CAShapeLayer()
    
    func buildBtn(target: CGFloat!, current: CGFloat!, diameter: CGFloat?, step: Bool) {
        self.layer.sublayers = nil
        self.target = target
        self.current = current
        self.setp = step
        if diameter != nil {
            self.diameter = diameter!
        }
        centerPoint = CGPoint(x: self.diameter / 2, y: self.diameter / 2)
        
        let circlePath = UIBezierPath(arcCenter: centerPoint!, radius: (self.diameter - self.strokeWidth) / 2, startAngle: CGFloat(M_PI/180 * (-90)), endAngle:CGFloat(M_PI/180*270), clockwise: true)
        let circleInsidePath = UIBezierPath(arcCenter: self.centerPoint!, radius: (self.diameter - (strokeWidth + strokeInsideWidth) * 2) / 2, startAngle: CGFloat(M_PI/180 * (-90)), endAngle: CGFloat(M_PI/180*270), clockwise: true)
        let checkPath = UIBezierPath()
        checkPath.moveToPoint(CGPoint(x: 52/2, y: 84/2))
        checkPath.addLineToPoint(CGPoint(x: 80/2, y: 113/2))
        checkPath.addLineToPoint(CGPoint(x: 124/2, y: 63/2))
        
        let strokeGray = CAShapeLayer()
        strokeGray.path = circlePath.CGPath
        strokeGray.fillColor = UIColor.clearColor().CGColor
        strokeGray.strokeColor = colorGray.CGColor
        strokeGray.lineWidth = strokeWidth
        strokeGray.strokeEnd = 1
        
        strokeRed.path = circlePath.CGPath
        strokeRed.fillColor = UIColor.clearColor().CGColor
        strokeRed.strokeColor = colorRed.CGColor
        strokeRed.lineWidth = strokeWidth
        strokeRed.lineCap = kCALineCapRound
        strokeRed.strokeEnd = 0
        
        strokeGreen.path = strokeRed.path
        strokeGreen.fillColor = strokeRed.fillColor
        strokeGreen.strokeColor = colorGreen.CGColor
        strokeGreen.lineWidth = strokeRed.lineWidth
        strokeGreen.lineCap = strokeRed.lineCap
        strokeGreen.strokeEnd = 1 / target * current
        
        let strokeCheck = CAShapeLayer()
        strokeCheck.path = checkPath.CGPath
        strokeCheck.fillColor = UIColor.clearColor().CGColor
        strokeCheck.strokeColor = UIColor.whiteColor().CGColor
        strokeCheck.lineWidth = strokeWidth
        strokeCheck.lineCap = kCALineCapRound
        strokeCheck.lineJoin = kCALineJoinRound
        
        btnBg.path = circleInsidePath.CGPath
        btnBg.fillColor = colorGray.CGColor
        btnBg.strokeEnd = 1
        
        self.addTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
        self.frame.size = CGSize(width: self.diameter,height: self.diameter)
        self.layer.cornerRadius = self.frame.size.width / 2
        self.layer.addSublayer(strokeGray)
        self.layer.addSublayer(strokeGreen)
        self.layer.addSublayer(strokeRed)
        self.layer.addSublayer(btnBg)
        self.layer.addSublayer(strokeCheck)
    }
    
    func buttonTapped(sender: UIButton) {
        //print("click")
        if self.setp {
            current! += 1
            strokeGreen.strokeEnd += 1 / target!
        } else {
            let animationEffect = CABasicAnimation(keyPath: "strokeEnd")
            animationEffect.duration = 0.2
            animationEffect.toValue = current! / target! + 0.1
            animationEffect.autoreverses = true
            strokeGreen.addAnimation(animationEffect, forKey: "strokeBounce")
        }
        
        //bounce
        UIView.animateWithDuration(0.1, animations: {
            self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.8, 0.8)
            }, completion: {complete in
                UIView.animateWithDuration(0.2, animations: {
                    self.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1)
                    }, completion: nil)
        })
        
        if current == target {
            strokeGreen.removeAnimationForKey(strokeAdd)
            strokeGreen.removeFromSuperlayer()
            self.removeTarget(self, action: "buttonTapped:", forControlEvents: UIControlEvents.TouchUpInside)
            
            //set color
            let animationColor = CABasicAnimation(keyPath: "fillColor")
            animationColor.delegate = self
            animationColor.removedOnCompletion = false
            animationColor.fillMode = kCAFillModeForwards
            animationColor.toValue = colorRed.CGColor
            animationColor.duration = 0.5
            animationColor.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            btnBg.addAnimation(animationColor, forKey: "changeColor")
            
            //set red stroke
            let animationRedStroke = CABasicAnimation(keyPath: "strokeEnd")
            animationRedStroke.delegate = self
            animationRedStroke.removedOnCompletion = false
            animationRedStroke.fillMode = kCAFillModeForwards
            animationRedStroke.toValue = 1
            animationRedStroke.duration = 0.5
            animationRedStroke.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
            strokeRed.addAnimation(animationRedStroke, forKey: "show red stroke")
        }
    }
    
    override func animationDidStop(anim: CAAnimation, finished flag: Bool) {
        strokeRed.strokeEnd = 1
        strokeRed.removeAllAnimations()
        btnBg.fillColor = colorRed.CGColor
        btnBg.removeAllAnimations()
    }

    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect) {
        // Drawing code
    }
    */

}
