//
//  ViewControllerCover.swift
//  UIConpoments
//
//  Created by Automan on 3/5/16.
//  Copyright © 2016 Automan. All rights reserved.
//

import UIKit

class ViewControllerCover: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    let cellIDCover = "coverCell"
    var cover1: UIButton?
    var cover2: UIButton?
    var cover3: UIButton?
    var cover4: UIButton?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.title = "话题们"
        let coverList = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        coverList.delegate = self
        coverList.dataSource = self
        coverList.registerClass(TableViewCellCover.self, forCellReuseIdentifier: cellIDCover)
        self.view.addSubview(coverList)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: TableViewCellCover? = tableView.dequeueReusableCellWithIdentifier(cellIDCover, forIndexPath: indexPath) as? TableViewCellCover
        
        if cell == nil {
            cell = TableViewCellCover(style: UITableViewCellStyle.Default, reuseIdentifier: cellIDCover)
        }
        
        switch indexPath.row {
        case 0:
            cell!.titleText = "看谁笑的最夸张"
            cell!.subtitleText = "蛤蛤蛤"
            cell!.imageAddress = "giphy"
            break
        case 1:
            cell!.titleText = "新人报道"
            cell!.subtitleText = "一大波小鲜肉正在袭来"
            cell!.imageAddress = "meat"
            break
        case 2:
            cell!.titleText = "清唱大赛"
            cell!.subtitleText = "不看脸, 无伴奏, 真正考验唱功"
            cell!.imageAddress = "sing"
            break
        case 3:
            cell!.titleText = "我拍你猜"
            cell!.subtitleText = ""
            cell!.imageAddress = "guess"
            break
        default:
            print("cell error")
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 160
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
