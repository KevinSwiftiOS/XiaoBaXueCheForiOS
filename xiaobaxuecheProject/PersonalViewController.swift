//
//  PersonalViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/14.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    let button = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        button.setImage(UIImage(named:"后退"), for: .normal)
        button.addTarget(self, action: #selector(PersonalViewController.back), for:.touchUpInside)
        let leftItem = UIBarButtonItem(customView: button)
        self.navigationItem.leftBarButtonItem = leftItem
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func back() {
        self.dismiss(animated: true, completion: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    override func viewWillAppear(_ animated: Bool) {
        let app = UIApplication.shared.delegate  as! AppDelegate
        app.slide?.tabBar.myView?.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        let app = UIApplication.shared.delegate  as! AppDelegate
        app.slide?.tabBar.myView?.isHidden = false
    }

    @IBAction func dis(_ sender: UIButton) {
self.dismiss(animated: true, completion: nil)
    }
  }
