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

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
