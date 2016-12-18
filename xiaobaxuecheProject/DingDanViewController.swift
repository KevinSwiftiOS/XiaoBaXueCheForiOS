//
//  DingDanViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/18.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class DingDanViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        button.setImage(UIImage(named:"后退"), for: .normal)
        button.addTarget(self, action: #selector(DingDanViewController.back), for:.touchUpInside)
        let leftItem = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = leftItem
        let items = ["未完成","待评价","已评价","待处理"]
    
        let segmentControl = UISegmentedControl(items: items)
  
        
        segmentControl.frame = CGRect(x: 50, y: 0, width: SCREEN_WIDTH - 100, height:43)
        segmentControl.selectedSegmentIndex = 0
       self.navigationController?.navigationBar.addSubview(segmentControl)
        
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func back() {
        self.dismiss(animated: true, completion: nil)
    }


  }
