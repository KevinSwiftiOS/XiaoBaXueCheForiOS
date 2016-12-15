//
//  QusViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/12.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class QusViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    let testOne = ["顺序练习","模拟练习"]
    let testFour = ["顺序练习","多选题练习","动画题加强练习","模拟考试"]
    let totalArr = NSMutableArray()
    
    @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
       tableView.delegate = self
       tableView.dataSource = self
        totalArr.add(testOne)
        totalArr.add(testFour)
        self.tableView.tableFooterView = UIView()
      self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr = totalArr[section] as! NSArray
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifer = "cell"
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifer)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifer)
        }
        let arr = totalArr[indexPath.section] as! NSArray
        cell?.textLabel?.text = arr[indexPath.row] as? String
        cell?.accessoryType  = .disclosureIndicator
        return cell!

    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
      func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if(section == 0){
            return "科目一"
        }else{
            return "科目四"
        }
    }
}
