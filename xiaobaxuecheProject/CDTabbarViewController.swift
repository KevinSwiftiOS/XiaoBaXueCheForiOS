//
//  CDTabbarViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/13.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class CDTabbarViewController: UITabBarController {
    var selectedBtn = UIButton()
    var myView:UIView?
  
    let selImages = ["ic_exercise_tab","ic_learn_tab","ic_peijia_tab","ic_serve_tab"]
    let unselImages = ["icon_tab_left","icon_tab_middle","icon_tab_middle","icon_tab_right"]
 let titles = ["题库","学车","陪驾","服务"]
    var learnCarVC:MapViewController?
    var qusVC:QusViewController?
    var serveVC:ServiceViewController?
    var peiJiaVC:WithDrivingViewController?
    var leftItem:UIBarButtonItem?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpChildVC()
       self.setupTabBar()
      
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    func setUpChildVC(){
    let sb = UIStoryboard(name: "Main", bundle: nil)
  
         learnCarVC = sb.instantiateViewController(withIdentifier: "learnVC") as? MapViewController
       serveVC = sb.instantiateViewController(withIdentifier: "serviceVC") as? ServiceViewController
         peiJiaVC = sb.instantiateViewController(withIdentifier: "peijiaVC") as? WithDrivingViewController
         qusVC = sb.instantiateViewController(withIdentifier: "qusVC") as? QusViewController
        let serviceNav = UINavigationController(rootViewController: serveVC!)
        let learnCarNav = UINavigationController(rootViewController: learnCarVC!)
        let qusNav = UINavigationController(rootViewController: qusVC!)
        let peijiaNav = UINavigationController(rootViewController: peiJiaVC!)
  
        
        
        
        
        
//        serviceNav.tabBarItem.title = "服务"
//        serviceNav.tabBarItem.image = UIImage(named: "ic_serve_tab")
//        serviceNav.tabBarItem.selectedImage =  UIImage(named: "icon_tab_right")
//        learnCarVC.tabBarItem.title = "学车"
//        learnCarVC.tabBarItem.image = UIImage(named: "ic_learn_tab")
//        learnCarNav.tabBarItem.selectedImage =  UIImage(named: "icon_tab_middle")
//        peiJiaVC?.tabBarItem.title = "陪驾"
//        peiJiaVC?.tabBarItem.image = UIImage(named: "ic_peijia_tab")
//        peiJiaVC?.tabBarItem.selectedImage =  UIImage(named: "icon_tab_middle")
//
//        qusNav.tabBarItem.title = "题库"
//        learnCarNav.tabBarItem.image = UIImage(named: "ic_exercise_tab")
//        learnCarNav.tabBarItem.selectedImage =  UIImage(named: "icon_tab_left")
     
         //        qusVC.navigationItem.leftBarButtonItem = leftItem
//
//        serviceVC.navigationItem.leftBarButtonItem = leftItem
//
        
        
        
        self.viewControllers = [qusNav,learnCarNav,peijiaNav,serviceNav]
       
        
        
        
    }
    func setupTabBar() {
        let rect = self.tabBar.frame
        self.tabBar.removeFromSuperview()
         myView = UIView(frame: CGRect(x: 0, y: rect.origin.y - 20, width: SCREEN_WIDTH, height: rect.size.height + 20))
      
        self.view.addSubview(myView!)
        for i in 0 ..< 4{
            let button = CDTabBarButton()
        
            button.setTitle(titles[i], for: .normal)
            button.setImage(UIImage(named:unselImages[i]), for: .normal)
            button.setImage(UIImage(named:selImages[i]), for: .selected)
            let x = (CGFloat)(i)  * (myView?.frame.size.width)! / 4
            button.frame = CGRect(x: x, y: 0, width: (myView?.frame.size.width)! / 4, height: (myView?.frame.size.height)!)
            button.tag = i
         button.titleLabel?.font = UIFont.systemFont(ofSize: 12)
            button.imageEdgeInsets = UIEdgeInsetsMake(5, 13, 21,(button.titleLabel?.bounds.size.width)!)
            button.titleLabel?.textAlignment = .center
            button.titleEdgeInsets = UIEdgeInsetsMake(40, -1 * (button.titleLabel?.bounds.size.width)! - 45, 0, 0)
            button.setTitleColor(UIColor.black, for: .normal)
            myView?.addSubview(button)
            button.addTarget(self, action: #selector(CDTabbarViewController.clickBtn), for: .touchUpInside)
            if(i == 1){
                button.isSelected = true
                self.selectedBtn = button
               self.selectedIndex = 1
            }
        }
        
        
    }
    func clickBtn(sender:UIButton) {
       self.selectedBtn.isSelected = false;
        sender.isSelected = true
        self.selectedBtn = sender
        self.selectedIndex = sender.tag
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("app")
        self.myView?.isHidden = false
    }
    override func viewWillDisappear(_ animated: Bool) {
       
        super.viewWillDisappear(animated)
        print("dis")
        self.myView?.isHidden = true
    }

  }
