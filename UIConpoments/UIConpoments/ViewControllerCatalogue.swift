//
//  ViewControllerCatalogue.swift
//  UIConpoments
//
//  Created by Automan on 3/7/16.
//  Copyright © 2016 Automan. All rights reserved.
//

import UIKit

class ViewControllerCatalogue: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let cellID = "cell"

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "Catalogue"
        
        let uiList = UITableView(frame: self.view.frame, style: UITableViewStyle.Plain)
        uiList.delegate = self
        uiList.dataSource = self
        uiList.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellID)
        self.view.addSubview(uiList)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell: UITableViewCell? = tableView.dequeueReusableCellWithIdentifier(cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellID)
        }
        
        switch indexPath.row {
        case 0:
            cell?.textLabel?.text = "Button Step"
        case 1:
            cell?.textLabel?.text = "Button none step"
        case 2:
            cell?.textLabel?.text = "Cover"
        case 3:
            cell?.textLabel?.text = "Collection view"
        default:
            break
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(ViewControllerBtnStep(), animated: true)
        case 1:
            self.navigationController?.pushViewController(ViewControllerNoneStep(), animated: true)
        case 2:
            self.navigationController?.pushViewController(ViewControllerCover(), animated: true)
        case 3:
            self.navigationController?.pushViewController(ViewControllerCollection(), animated: true)
        default:
            break
        }
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
