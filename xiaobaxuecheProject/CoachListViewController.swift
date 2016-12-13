//
//  CoachListViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/13.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class CoachListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    let names = ["鲍宏","蒋斌宽"]
    let yuyueCnt = [2965,1736]
    let detail = ["招生范围","浙江省余杭区"]
    @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView  = UIView()
        let leftBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        leftBtn.setBackgroundImage(UIImage(named:"map_btn"), for: .normal)
        let rightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        rightBtn.setBackgroundImage(UIImage(named:"list_search_btn"), for: .normal)
        let leftBarItem = UIBarButtonItem(customView: leftBtn)
        let rightBarItem = UIBarButtonItem(customView: rightBtn)
        leftBtn.addTarget(self, action: #selector(CoachListViewController.back), for: .touchUpInside)
        rightBtn.addTarget(self, action: #selector(CoachListViewController.search), for: .touchUpInside)
        self.navigationItem.leftBarButtonItem = leftBarItem
        self.navigationItem.rightBarButtonItem = rightBarItem
       
        self.automaticallyAdjustsScrollViewInsets = false
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CoachDetailCell") as!
        CoachDetailTableViewCell
        cell.headImage.image = UIImage(named: "ico_约考")
        cell.coachName.text = names[indexPath.row]
        cell.cnt.text = "预约次数" + "\(yuyueCnt[indexPath.row])"
        cell.des.text = detail[indexPath.row]
        return cell
    }
    func back() {
        self.navigationController?.popViewController(animated: true)
    }
    func search() {
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    self.navigationController?.navigationBar.isHidden = false
        self.tabBarController?.tabBar.isHidden = true
        
    }
}

