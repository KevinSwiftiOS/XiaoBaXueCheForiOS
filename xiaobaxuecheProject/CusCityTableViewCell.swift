//
//  CusCityTableViewCell.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/12.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class CusCityTableViewCell: UITableViewCell {
    @IBOutlet weak var hangzhouBtn:UIButton!
    @IBOutlet weak var jinghuaBtn:UIButton!
    @IBOutlet weak var ningboBtn:UIButton!
    @IBOutlet weak var shanghaiBtn:UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.hangzhouBtn.layer.borderWidth = 0.5
        self.jinghuaBtn.layer.borderWidth = 0.5
        self.ningboBtn.layer.borderWidth = 0.5
        self.shanghaiBtn.layer.borderWidth = 0.5
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
