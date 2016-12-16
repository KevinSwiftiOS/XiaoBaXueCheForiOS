//
//  SearchViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/13.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController {
    @IBOutlet weak var cancelBtn:UIButton!
    @IBOutlet weak var searchTextField:UITextField!
    @IBOutlet weak var anyBtn:UIButton!
    @IBOutlet weak var kemuerBtn:UIButton!
    @IBOutlet weak var kemusanBtn:UIButton!
    @IBOutlet weak var exeBtn:UIButton!
    @IBOutlet weak var experBtn:UIButton!
    @IBOutlet weak var resetBtn:UIButton!
    override func viewDidLoad() {
        self.title = "教练删选"
        super.viewDidLoad()
        cancelBtn.frame = CGRect(x: SCREEN_WIDTH - 50 - 10, y: 10, width: 50, height: 50)
        cancelBtn.addTarget(self, action: #selector(SearchViewController.cancel), for: .touchUpInside)
        anyBtn.tag = 1
        kemuerBtn.tag = 2
        kemusanBtn.tag = 3
        exeBtn.tag = 4
        experBtn.tag = 5
        
        anyBtn.addTarget(self, action: #selector(SearchViewController.kemu), for: .touchUpInside)
           kemuerBtn.addTarget(self, action: #selector(SearchViewController.kemu), for: .touchUpInside)
           kemusanBtn.addTarget(self, action: #selector(SearchViewController.kemu), for: .touchUpInside)
           exeBtn.addTarget(self, action: #selector(SearchViewController.kemu), for: .touchUpInside)
           experBtn.addTarget(self, action: #selector(SearchViewController.kemu), for: .touchUpInside)
        resetBtn.addTarget(self, action: #selector(SearchViewController.reset), for: .touchUpInside)
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
    func cancel() {
        self.dismiss(animated: true, completion: nil)
    }
    func kemu(sender:UIButton) {
        sender.setBackgroundImage(UIImage(named:"btn_myorder_fullgreen"), for: .normal)
       sender.setTitleColor(UIColor.white, for: .normal)
        for view in self.view.subviews{
            if(view.isKind(of: UIButton.classForCoder())){
                if(view.tag != 0 && view.tag != sender.tag){
                    let btn = view as! UIButton
                    btn.setBackgroundImage(UIImage(named:"btn_myorder_grey"), for: .normal)
                    btn.setTitleColor(UIColor.black, for: .normal)
                }
            }
        }
        }
    func reset() {
        self.searchTextField.text = ""
        for view in self.view.subviews{
            if(view.isKind(of: UIButton.classForCoder())){
                if(view.tag == 1 ){
                    let btn = view as! UIButton
                    btn.setBackgroundImage(UIImage(named:"btn_myorder_fullgreen"), for: .normal)
                   btn.setTitleColor(UIColor.white, for: .normal)                }
                if(view.tag > 0 && view.tag != 1){
                    let btn = view as! UIButton
                    btn.setBackgroundImage(UIImage(named:"btn_myorder_grey"), for: .normal)
                    btn.setTitleColor(UIColor.black, for: .normal)
                }
            }
        }

    }
    @IBAction func resign(_ sender: UIControl) {
        self.searchTextField.resignFirstResponder()
    }
  }
