//
//  TableViewCellCover.swift
//  UIConpoments
//
//  Created by Automan on 3/5/16.
//  Copyright © 2016 Automan. All rights reserved.
//

import UIKit

class TableViewCellCover: UITableViewCell {
    
    var titleText = ""
    var subtitleText = ""
    var imageAddress = ""

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let btn = getCover(self.titleText, subtitleText: self.subtitleText, imageAddress: self.imageAddress)
        btn.frame.origin.x = (Size().screen.width - btn.frame.size.width) / 2
        self.contentView.addSubview(btn)
    }

}
