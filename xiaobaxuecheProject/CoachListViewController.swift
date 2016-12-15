//
//  CoachListViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/13.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class CoachListViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    var names = NSArray()
    var yuyueCnt = NSArray()
    var detail = NSArray()
    @IBOutlet weak var tableView:UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tableFooterView  = UIView()
        self.tableView.mj_header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: #selector(CoachListViewController.headerRefresh))
        self.tableView.mj_header.beginRefreshing()
        let leftBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
        leftBtn.setBackgroundImage(UIImage(named:"map_btn"), for: .normal)
        let rightBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
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
        self.navigationController?.navigationBar.backgroundColor = UIColor.black
        self.navigationController?.navigationBar.alpha = 0.5
        tableView.deselectRow(at: indexPath, animated: true)
        let cusAction = CusActionView(head: UIImage(named: "ico_约考")!, des: self.detail[indexPath.row] as! String, num: self.yuyueCnt[indexPath.row] as! Int, name: self.names[indexPath.row] as! String, isTab: false,navigationBar:(self.navigationController?.navigationBar)!)
        self.view.addSubview(cusAction)
    
        cusAction.show()
        
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
        cell.coachName.text = names[indexPath.row] as? String
        cell.cnt.text = "预约次数" + "\(yuyueCnt[indexPath.row] as! NSInteger )"
        cell.des.text = detail[indexPath.row] as! String
        return cell
    }
    func back() {
       
        _ = navigationController?.popViewController(animated: true)

    }
    func search() {
        let sb = UIStoryboard(name: "LearnCar", bundle: nil)
        let searchVC = sb.instantiateViewController(withIdentifier: "SearchVC")
            as! SearchViewController
        self.present(searchVC, animated: true, completion: nil)

    }
       func headerRefresh() {
         names = ["鲍宏","蒋斌宽"]
         yuyueCnt = [2965,1736]
         detail = ["招生范围","浙江省余杭区"]
       self.tableView.reloadData()
        self.tableView.mj_header.endRefreshing()
    }
    override func viewWillAppear(_ animated: Bool) {
        let app = UIApplication.shared.delegate  as! AppDelegate
        app.slide?.tabBar.myView?.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        let app = UIApplication.shared.delegate  as! AppDelegate
        app.slide?.tabBar.myView?.isHidden = false
    }

}

