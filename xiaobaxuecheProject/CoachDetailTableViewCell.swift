//
//  CoachDetailTableViewCell.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/13.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class CoachDetailTableViewCell: UITableViewCell {
    @IBOutlet weak var headImage:UIImageView!
    @IBOutlet weak var coachName:UILabel!
    @IBOutlet weak var cnt:UILabel!
    @IBOutlet weak var des:UITextView!
    override func awakeFromNib() {
        super.awakeFromNib()
        cnt.font = UIFont.systemFont(ofSize: 12)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
