//
//  API.swift
//  Amanda
//
//  Created by Automan on 2/24/16.
//  Copyright © 2016 Automan. All rights reserved.
//

import Foundation
import UIKit

func getCover(titleText: String, subtitleText: String, imageAddress: String) -> UIButton {
    let width = Size().screen.width - 20
    let height: CGFloat = 150
    let container = UIButton(frame: CGRectMake(0,0,width,height))
    container.clipsToBounds = true
    
    let bgImage = UIImageView(image: UIImage.gifWithName(imageAddress))
    bgImage.frame = container.frame
    bgImage.contentMode = UIViewContentMode.ScaleAspectFill
    container.addSubview(bgImage)
    
    let mask = UIView()
    mask.frame = container.frame
    mask.backgroundColor = UIColor(white: 0, alpha: 0.5)
    container.addSubview(mask)
    
    let titleLabel = UILabel(frame: CGRectMake(0,50,Size().screen.width,30))
    titleLabel.text = titleText
    titleLabel.textColor = UIColor.whiteColor()
    titleLabel.font = UIFont(name: Fonts().medium, size: 17)
    titleLabel.textAlignment = NSTextAlignment.Center
    container.addSubview(titleLabel)
    
    let subTitleLabel = UILabel(frame: CGRectMake(0,82,Size().screen.width,18))
    subTitleLabel.text = subtitleText
    subTitleLabel.textColor = UIColor.whiteColor()
    subTitleLabel.font = UIFont(name: Fonts().medium, size: 12)
    subTitleLabel.textAlignment = NSTextAlignment.Center
    container.addSubview(subTitleLabel)
    
    return container
}

//struct LocalData {
//    let userDefaults = NSUserDefaults.standardUserDefaults()
//    let keyUser = "user"
//    let keyLogin = "login"
//    let valueUserAutoman = ["id":0, "name":"automan", "callNumber":"15821386876", "password":"111111","chatWith":"amanda"]
//    let valueUserAmanda = ["id":1, "name":"amanda", "callNumber":"18621579857", "password":"111111","chatWith":"automan"]
//    let valueUserMac = ["id":2, "name":"mac", "callNumber":"10086", "password":"111111","chatWith":"Automan"]
//}

//struct API {
//    //weather
//    let baiduAPIKey = "2cbde43749a4c5edf90819007111c32a"
//    let weatherAPIURL = "http://apis.baidu.com/heweather/weather/free"
//    let city = "shanghai"
//    //unsplash
//    let unsplashAppID = "23e4b86b222fdf6adf03e245ae68e414b4b6453f4da4f17c15c7bf6e73a2e1cc"
//    let unsplashSecret = "9f6e4d39c1038b2f9923e6723dd41e595b2ad99983592561d6735ec3ed485d62"
//    let unsplashToken = "9372636da7dfc0969ef4042fe6bf9239b47f41713d34a92d321f8d540455e321"
//    let unsplashSource = NSURL(string: "https://source.unsplash.com/random")
//    let unsplashAPI = "https://api.unsplash.com/photos/random"
//}

struct Colors {
    let bgColor = UIColor(red: 234/255, green: 234/255, blue: 234/255, alpha: 1)
    let photo = UIColor.blackColor()
}

struct Size {
    let screen = UIScreen.mainScreen().bounds
}
//
struct Fonts {
    let light = "PingFangSC-Light"
    let medium = "PingFangSC-Medium"
    let regular = "PingFangSC-Regular"
    let semibold = "PingFangSC-Semibold"
    let thin = "PingFangSC-Thin"
    let ultralight = "PingFangSC-Ultralight"
}

//public func btnBlink(sender: UIButton) {
//    UIView.animateWithDuration(0.1, delay: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: {
//        sender.alpha = 0
//        }, completion: {finished in
//            UIView.animateWithDuration(0.2, delay: 0, options: UIViewAnimationOptions.AllowUserInteraction, animations: {
//                sender.alpha = 1
//                }, completion: {finished in})
//    })
//}

//public func getLoginButton(user: String) -> UIButton {
//    let btn = UIButton()
//    btn.frame.size = CGSize(width: Size().screen.width * 0.7, height: 44)
//    btn.layer.borderColor = UIColor.blackColor().CGColor
//    btn.layer.borderWidth = 1.5
//    btn.setTitleColor(UIColor.blackColor(), forState: UIControlState.Normal)
//    btn.setTitle("."+user, forState: UIControlState.Normal)
//    btn.titleLabel?.font = UIFont(name: Fonts().medium, size: 14)
//    
//    return btn
//}