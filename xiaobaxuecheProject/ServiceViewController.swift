//
//  ServiceViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/12.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class ServiceViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,Send {
    @IBOutlet weak var tableView:UITableView!
    let titles = ["小巴商城","在线约考","模拟练习","小巴在线客服"]
    var details = ["学车报名活动火爆开启","科目二,科目三考试 免费预约","模拟一,模拟二,免费预约","实时在线与您交流"]
    let imagesNames = ["ico_约考","ico_模拟培训","ico_客服","ico_客服"]
    var localBtn = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.automaticallyAdjustsScrollViewInsets = false

         localBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        localBtn.setTitle("杭州", for: .normal)
        localBtn.setTitleColor(UIColor.green, for: .normal)
      localBtn.addTarget(self, action: #selector(ServiceViewController.showCities), for: .touchUpInside)
       let barItem = UIBarButtonItem(customView: localBtn)
        self.navigationItem.rightBarButtonItem = barItem
        
   
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifer = "cell"
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifer)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifer)
        }
        cell?.imageView?.image = UIImage(named: imagesNames[indexPath.section])
cell?.textLabel?.text = self.titles[indexPath.section] 
        cell?.detailTextLabel?.text = self.details[indexPath.section] 
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 20.0
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.0
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //打开safari浏览器
      
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
        case 0:
            //打开小巴商城
            UIApplication.shared.openURL(NSURL(string: "http://www.hzti.com:9004/drv_web/index.do") as! URL)
        case 1:
             UIApplication.shared.openURL(NSURL(string: "http://www.hzti.com:9004/drv_web/index.do") as! URL)
        case 2:
             UIApplication.shared.openURL(NSURL(string: "http://115.238.28.138:8023/genstudentsimreserve/orderIndex") as! URL)
        case 3:
            //打开与客服服务
            print("客服服务")
        default:
            break
        }
    }
    func  showCities(sender:UIButton) {
       
        let ServiceSb = UIStoryboard(name: "Service", bundle: nil)
      
        let cityVC = ServiceSb.instantiateViewController(withIdentifier: "cityVC") as! CityViewController
        cityVC.delegate = self
        cityVC.sel = (sender.titleLabel?.text)!
        self.navigationController?.pushViewController(cityVC, animated: true)
    }
    func send(value: String) {
        localBtn.setTitle(value, for: .normal)
    }
    override func viewWillAppear(_ animated: Bool) {
          self.tabBarController?.tabBar.isHidden = false
    }
}
