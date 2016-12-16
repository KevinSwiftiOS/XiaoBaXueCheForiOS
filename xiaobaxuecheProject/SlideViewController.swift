//
//  SlideViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/14.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController,UIViewControllerTransitioningDelegate,UITableViewDelegate,UITableViewDataSource {
   let tabBar = CDTabbarViewController()
   //个人信息的tableView
    var tableView = UITableView()
    
    var orderBtn = UIButton()
    //侧滑的view
    var myView:UIView!
    var tap:UITapGestureRecognizer!
    //是否展示侧滑单
    var isshow = false
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tap = UITapGestureRecognizer(target: self, action: #selector(SlideViewController.resign))
        self.automaticallyAdjustsScrollViewInsets = false
        self.view.addSubview(tabBar.view)
        let button = UIButton(frame: CGRect(x: 10, y: 15, width: 50, height: 50))
        button.setImage(UIImage(named:"ic_我的"), for: .normal)
        let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        button1.setImage(UIImage(named:"ic_我的"), for: .normal)
        let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        button2.setImage(UIImage(named:"ic_我的"), for: .normal)
        let button3 = UIButton(frame: CGRect(x: 10, y: 15, width: 50, height: 50))
        button3.setImage(UIImage(named:"ic_我的"), for: .normal)
        button.addTarget(self, action: #selector(SlideViewController.slide), for: .touchUpInside)
        button1.addTarget(self, action: #selector(SlideViewController.slide), for: .touchUpInside)
        button2.addTarget(self, action: #selector(SlideViewController.slide), for: .touchUpInside)
        button3.addTarget(self, action: #selector(SlideViewController.slide), for: .touchUpInside)
        let   leftItem1 = UIBarButtonItem(customView: button1)
        let   leftItem2 = UIBarButtonItem(customView: button2)
       
        tabBar.learnCarVC?.view.addSubview(button)
        tabBar.qusVC?.navigationItem.leftBarButtonItem = leftItem1
        tabBar.serveVC?.navigationItem.leftBarButtonItem = leftItem2
        tabBar.peiJiaVC?.view.addSubview(button3)
        orderBtn = UIButton(frame: CGRect(x: 10, y: 200, width: 100, height: 100))
        orderBtn.setTitle("我的订单", for: .normal)
        orderBtn.addTarget(self, action: #selector(SlideViewController.order), for: .touchUpInside)
        orderBtn.setTitleColor(UIColor.black, for: .normal)
        myView = UIView()
        myView.frame = CGRect(x: -1 * SCREEN_WIDTH / 2, y: 0, width:SCREEN_WIDTH / 2, height: SCREEN_HEIGHT)
      tableView = UITableView(frame: CGRect(x: 0, y: 50, width: SCREEN_WIDTH / 2, height: 100))
        self.tableView.tableFooterView = UIView()

           tableView.delegate = self
        tableView.dataSource = self
        myView.addSubview(tableView)
        view.backgroundColor = UIColor.white
        myView.addSubview(orderBtn)
        
        self.view.addSubview(self.myView)

               // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func slide() {
    isshow = !isshow
        if(isshow){
          
            self.view.addGestureRecognizer(self.tap)
                UIView.animate(withDuration: 0.3, animations: {
             self.myView.frame = CGRect(x: 0, y: 0, width:SCREEN_WIDTH / 2, height: SCREEN_HEIGHT)
            self.tabBar.view.frame = CGRect(x: SCREEN_WIDTH / 2, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
         
        }) { (finish:Bool) in
   
   }
        }else{
                       UIView.animate(withDuration: 0.3, animations: {
                   self.tabBar.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
                        self.myView.frame = CGRect(x: -1 * SCREEN_WIDTH / 2, y: 0, width: SCREEN_WIDTH / 2, height: SCREEN_HEIGHT)
            
            }, completion: { (finish:Bool) in
                 self.view.removeGestureRecognizer(self.tap)

            })
        }
         self.tabBar.myView?.isUserInteractionEnabled = !isshow
          }
    func order() {
        let learnCarSb = UIStoryboard(name: "Personal", bundle: nil)
        let PersonalVC = learnCarSb.instantiateViewController(withIdentifier: "PersonalVC") as! UINavigationController
        PersonalVC.title = "订单列表"
        PersonalVC.transitioningDelegate = self
   //     self.isshow = false
    //  tabBar.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
       
  //      myView.frame = CGRect(x: -100, y: 0, width:100, height: SCREEN_HEIGHT)
        //    self.modalPresentationStyle = .custom
        self.present(PersonalVC, animated: true, completion: nil)
   
        
    }
    func resign() {
        isshow = !isshow
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBar.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            self.myView.frame = CGRect(x: -1 * SCREEN_WIDTH / 2, y: 0, width:SCREEN_WIDTH / 2, height: SCREEN_HEIGHT)
          

            
        }, completion: { (finish:Bool) in
            
            self.view.removeGestureRecognizer(self.tap)

        })
 self.tabBar.myView?.isUserInteractionEnabled = !isshow
    }
    
    
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let isFrom = true
        return HalfWaySpringAnimator(isFrom: isFrom)
    }
    
    
    
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        let isFrom = false
        return HalfWaySpringAnimator(isFrom: isFrom)

    }
    //tablView的事件
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifer = "cell"
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifer)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifer)
        }
        cell?.imageView?.image = UIImage(named:"ico_客服")
        cell?.textLabel?.text = "未设置"
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell?.detailTextLabel?.text = "17816869731"
        cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 8)
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    }
