//
//  ViewControllerCollection.swift
//  UIConpoments
//
//  Created by Automan on 3/7/16.
//  Copyright © 2016 Automan. All rights reserved.
//

import UIKit

class ViewControllerCollection: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    let itemID = "Item"
    let cellWidth = Size().screen.width / 2 - 1

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = Colors().bgColor
        
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 2
        layout.minimumLineSpacing = 2
        layout.itemSize = CGSize(width: cellWidth, height: cellWidth)
        let photoList = UICollectionView(frame: self.view.frame, collectionViewLayout: layout)
        photoList.registerClass(UICollectionViewCell.self, forCellWithReuseIdentifier: itemID)
        photoList.backgroundColor = UIColor.clearColor()
        photoList.delegate = self
        photoList.dataSource = self
        self.view.addSubview(photoList)
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        var item: UICollectionViewCell? = collectionView.dequeueReusableCellWithReuseIdentifier(itemID, forIndexPath: indexPath)
        
        if item == nil {
            item = UICollectionViewCell()
        }
        
        item?.contentView.backgroundColor = UIColor.whiteColor()
        item?.contentMode = UIViewContentMode.ScaleAspectFill
        item?.clipsToBounds = true
        dispatch_async(dispatch_get_main_queue(), {block in
            let url = NSURL(string: "https://source.unsplash.com/random")
            let data = NSData(contentsOfURL: url!)
            let photo = UIImageView(image: UIImage(data: data!))
            photo.frame = CGRectMake(0, 0, self.cellWidth, self.cellWidth)
            photo.contentMode = UIViewContentMode.ScaleAspectFill
            item?.addSubview(photo)
        })
        
        return item!
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
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
