//
//  ViewControllerDetail.swift
//  UIConpoments
//
//  Created by Automan on 3/7/16.
//  Copyright © 2016 Automan. All rights reserved.
//

import UIKit

class ViewControllerDetail: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = Colors().bgColor
        
        let url = NSURL(string: "https://source.unsplash.com/random")
        let data = NSData(contentsOfURL: url!)
        let photo = UIImageView(image: UIImage(data: data!))
        photo.frame = CGRectMake(0, 0, Size().screen.width, Size().screen.width)
        photo.contentMode = UIViewContentMode.ScaleAspectFill
        self.view.addSubview(photo)
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
