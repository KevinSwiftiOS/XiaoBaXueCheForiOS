//
//  headerView.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/18.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit
protocol clickHeaderViewDelegate{
    func clickHeader()
}
class headerView: UIView {
    var headerDelegate:clickHeaderViewDelegate?
    override init(frame:CGRect){
        super.init(frame: frame)
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        imageView.image = UIImage(named:"ico_客服")
        let label = UILabel(frame: CGRect(x: 55, y: 0, width: 100, height: 30))
        label.text = "未设置"
        let subTitle = UILabel(frame: CGRect(x: 55, y: 35, width: 100, height: 30))
        subTitle.text = "17816869731"
        subTitle.font = UIFont.systemFont(ofSize: 10)
        self.addSubview(imageView)
        self.addSubview(label)
        self.addSubview(subTitle)
        self.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(headerView.click)))
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func click() {
       self.headerDelegate?.clickHeader()
    }
}
