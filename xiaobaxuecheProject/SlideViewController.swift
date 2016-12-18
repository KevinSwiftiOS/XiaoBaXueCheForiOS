//
//  SlideViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/14.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController,UIViewControllerTransitioningDelegate,UITableViewDelegate,UITableViewDataSource,clickHeaderViewDelegate  {
   let tabBar = CDTabbarViewController()
   //个人信息的tableView
    var tableView = UITableView()
    var collectonView:UICollectionView!
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
        myView = UIView()
        myView.frame = CGRect(x: -1 * 200, y: 0, width:200, height: SCREEN_HEIGHT)
      tableView = UITableView(frame: CGRect(x: 0, y: 50, width: 200,height: 100))
        self.tableView.tableFooterView = UIView()
        //加btn
        let btn1 = UIButton(frame: CGRect(x: 0, y: 200, width: 100, height: 100))
        let btn2 = UIButton(frame: CGRect(x: 100, y: 200, width: 100, height: 100))
        let btn3 = UIButton(frame: CGRect(x: 0, y: 300, width: 100, height: 100))
        let btn4 = UIButton(frame: CGRect(x: 100, y: 300, width: 100, height: 100))
        btn1.setTitle("我的订单", for: .normal)
        btn2.setTitle("钱包", for: .normal)
        btn3.setTitle("消息", for: .normal)
        btn4.setTitle("系统", for: .normal)
        btn1.layer.borderWidth = 1.0
        btn2.layer.borderWidth = 1.0
        btn3.layer.borderWidth = 1.0
        btn4.layer.borderWidth = 1.0

          btn1.setTitleColor(UIColor.black, for: .normal)
          btn2.setTitleColor(UIColor.black, for: .normal)
          btn3.setTitleColor(UIColor.black, for: .normal)
          btn4.setTitleColor(UIColor.black, for: .normal)
        
        btn1.tag = 1
        btn2.tag = 2
        btn3.tag = 3
        btn4.tag = 4
        btn1.addTarget(self, action: #selector(SlideViewController.click), for: .touchUpInside)
           btn2.addTarget(self, action: #selector(SlideViewController.click), for: .touchUpInside)
           btn3.addTarget(self, action: #selector(SlideViewController.click), for: .touchUpInside)
           btn4.addTarget(self, action: #selector(SlideViewController.click), for: .touchUpInside)
        let header = headerView(frame: CGRect(x: 0, y: 50, width: 200, height: 60))
        header.headerDelegate = self
        
        
        
         tableView.delegate = self
        tableView.dataSource = self
        myView.addSubview(header)
        myView.addSubview(btn1)
         myView.addSubview(btn2)
         myView.addSubview(btn3)
         myView.addSubview(btn4)
        view.backgroundColor = UIColor.white
        
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
            self.tableView.removeGestureRecognizer(self.tap)
                UIView.animate(withDuration: 0.3, animations: {
                    self.myView.frame = CGRect(x: 0, y: 0, width:200, height: SCREEN_HEIGHT)
                   
       self.tabBar.view.frame = CGRect(x: 200, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
         
        }) { (finish:Bool) in
         
   
   }
        }else{
                       UIView.animate(withDuration: 0.3, animations: {
                   self.tabBar.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
                        self.myView.frame = CGRect(x: -1 * 200, y: 0, width: 200, height: SCREEN_HEIGHT)
            
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
            self.myView.frame = CGRect(x: -1 * 200, y: 0, width: 200, height: SCREEN_HEIGHT)
          

            
        }, completion: { (finish:Bool) in
            
            self.view.removeGestureRecognizer(self.tap)

        })
 self.tabBar.myView?.isUserInteractionEnabled = !isshow
    }
    
    func clickHeader(){
    //到个人中心界面
        let learnCarSb = UIStoryboard(name: "Personal", bundle: nil)
        let PersonalNav = learnCarSb.instantiateViewController(withIdentifier: "PersonalNav") as! UINavigationController
      
        PersonalNav.transitioningDelegate = self
        //     self.isshow = false
        //  tabBar.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
        
        //      myView.frame = CGRect(x: -100, y: 0, width:100, height: SCREEN_HEIGHT)
        //    self.modalPresentationStyle = .custom
        self.present(PersonalNav, animated: true, completion: nil)

    
    
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
        print(indexPath.row)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifer = "cell"
        var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier: identifer)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: identifer)
        }
        cell?.imageView?.image = UIImage(named:"ico_客服")
        cell?.textLabel?.text = "未设置"
//        cell?.textLabel?.font = UIFont.systemFont(ofSize: 12)
        cell?.detailTextLabel?.text = "17816869731"
     //   cell?.detailTextLabel?.font = UIFont.systemFont(ofSize: 8)
        cell?.accessoryType = .disclosureIndicator
        return cell!
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = CollectionViewCell(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
//            
//            
//            
//            
////            cell.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
//        
//        
////        let btn = UIButton(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
////        btn.setTitle("订单", for: .normal)
////        btn.setTitleColor(UIColor.blue, for: .normal)
////        btn.backgroundColor = UIColor.black
////        cell.contentView.addSubview(btn)
////        cell.contentView.backgroundColor = UIColor.blue
//        return cell
//    }
//    //定义每个cell的边框大小
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
//        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
//    }
//    //定义每个cell的大小
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width:50,height:50)
//    }
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        return 4
//    }
    
    func click(sender:UIButton){
        //到个人中心界面
        let learnCarSb = UIStoryboard(name: "Personal", bundle: nil)
        let DingDanNav = learnCarSb.instantiateViewController(withIdentifier: "DingDanNav") as! UINavigationController
              DingDanNav.transitioningDelegate = self
        let MessNav = learnCarSb.instantiateViewController(withIdentifier: "MessNav") as! UINavigationController
        MessNav.transitioningDelegate = self
        let WalletNav = learnCarSb.instantiateViewController(withIdentifier: "WalletNav") as! UINavigationController
        WalletNav.transitioningDelegate = self
        let SystemNav = learnCarSb.instantiateViewController(withIdentifier: "SystemNav") as! UINavigationController
        SystemNav.transitioningDelegate = self
       

        
      
      
        
        
        switch sender.tag {
        case 1:
            self.present(DingDanNav, animated: true, completion: nil)
          break
        case 2:
          
        self.present(WalletNav, animated: true, completion: nil)
            case 3:
            self.present(MessNav, animated: true, completion: nil)
        case 4:
          self.present(SystemNav, animated: true, completion: nil)
        default:
            break
            
        }
    }
    }
