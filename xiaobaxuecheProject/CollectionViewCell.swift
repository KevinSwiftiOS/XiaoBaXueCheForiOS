//
//  CollectionViewCell.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/18.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var btn:UIButton?
    override init(frame: CGRect) {
        super.init(frame: frame)
      btn = UIButton(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        btn?.backgroundColor = UIColor.red
        self.contentView.addSubview(btn!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
