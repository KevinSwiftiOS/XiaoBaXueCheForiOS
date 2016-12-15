//
//  SlideViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/14.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class SlideViewController: UIViewController {
   let tabBar = CDTabbarViewController()
   
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
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        button.setImage(UIImage(named:"ic_我的"), for: .normal)
        let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        button1.setImage(UIImage(named:"ic_我的"), for: .normal)
        let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        button2.setImage(UIImage(named:"ic_我的"), for: .normal)
        let button3 = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        button3.setImage(UIImage(named:"ic_我的"), for: .normal)
        button.addTarget(self, action: #selector(SlideViewController.slide), for: .touchUpInside)
        button1.addTarget(self, action: #selector(SlideViewController.slide), for: .touchUpInside)
        button2.addTarget(self, action: #selector(SlideViewController.slide), for: .touchUpInside)
        button3.addTarget(self, action: #selector(SlideViewController.slide), for: .touchUpInside)
        let   leftItem = UIBarButtonItem(customView: button)
        let   leftItem1 = UIBarButtonItem(customView: button1)
        let   leftItem2 = UIBarButtonItem(customView: button2)
        let   leftItem3 = UIBarButtonItem(customView: button3)
        tabBar.learnCarVC?.navigationItem.leftBarButtonItem = leftItem
        tabBar.qusVC?.navigationItem.leftBarButtonItem = leftItem1
        tabBar.serveVC?.navigationItem.leftBarButtonItem = leftItem2
        tabBar.peiJiaVC?.navigationItem.leftBarButtonItem = leftItem3
        orderBtn = UIButton(frame: CGRect(x: 10, y: 200, width: 100, height: 100))
        orderBtn.setTitle("我的订单", for: .normal)
        orderBtn.addTarget(self, action: #selector(SlideViewController.order), for: .touchUpInside)
        orderBtn.setTitleColor(UIColor.black, for: .normal)
        myView = UIView()
        myView.frame = CGRect(x: -100, y: 0, width:100, height: SCREEN_HEIGHT)
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
             self.myView.frame = CGRect(x: 0, y: 0, width:100, height: SCREEN_HEIGHT)
            self.tabBar.view.frame = CGRect(x: 100, y: 0, width: SCREEN_WIDTH - 100, height: SCREEN_HEIGHT)
         
        }) { (finish:Bool) in
   
   }
        }else{
                       UIView.animate(withDuration: 0.3, animations: {
                   self.tabBar.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
                        self.myView.frame = CGRect(x: -100, y: 0, width: 100, height: SCREEN_HEIGHT)
            
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
   //     self.isshow = false
    //  tabBar.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
       
  //      myView.frame = CGRect(x: -100, y: 0, width:100, height: SCREEN_HEIGHT)
        self.present(PersonalVC, animated: true, completion: nil)
       
//        switch tabBar.selectedIndex {
//        case 0:
//            tabBar.qusVC?.navigationController?.pushViewController(PersonalVC, animated: true)
//            break
//        case 1:
//            tabBar.learnCarVC?.navigationController?.pushViewController(PersonalVC, animated: true)
//            break
//        case 2:
//            tabBar.peiJiaVC?.navigationController?.pushViewController(PersonalVC, animated: true)
//            break
//        case 3:
//            tabBar.serveVC?.navigationController?.pushViewController(PersonalVC, animated: true)
//            break
//        default:
//            break
//        }
    
    }
    func resign() {
        isshow = !isshow
        UIView.animate(withDuration: 0.3, animations: {
            self.tabBar.view.frame = CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT)
            self.myView.frame = CGRect(x: -100, y: 0, width: 100, height: SCREEN_HEIGHT)
            
        }, completion: { (finish:Bool) in
            
            self.view.removeGestureRecognizer(self.tap)

        })
 self.tabBar.myView?.isUserInteractionEnabled = !isshow
    }
   }
