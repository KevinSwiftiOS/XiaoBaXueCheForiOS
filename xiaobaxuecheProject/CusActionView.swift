//
//  CusActionView.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/13.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit
protocol CusDelegate {
    func detail()
    func yuyue()
}
class CusActionView: UIView{
    var head = UIImageView()
    var name = UILabel()
    var yuyueNum = UILabel()
    var des = UILabel()
    var detailBtn  = UIButton()
    var yuyeBtn = UIButton()
    var bottomView:UIView?
    var delegate:CusDelegate?
    var MasView:UIView?
    var isTab:Bool?
    var navigationBar:UINavigationBar?
    init(head:UIImage,des:String,num:Int,name:String,isTab:Bool,navigationBar:UINavigationBar) {
        super.init(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT))
        self.isTab = isTab
        self.navigationBar = navigationBar
        self.MasView = UIView(frame: CGRect(x: 0, y: -64, width: SCREEN_WIDTH, height: SCREEN_HEIGHT + 64))
        self.bottomView = UIView(frame:CGRect(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height: 150))
        self.head = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        self.head.image = head
       self.name = UILabel(frame: CGRect(x: 65, y: 10, width: 100, height: 20))
        self.name.text = name
        let starImageView = UIImageView(frame:CGRect(x: 65, y: 35, width: 30, height: 30))
        starImageView.image = UIImage(named: "coach_star_full")
        self.yuyueNum = UILabel(frame: CGRect(x: 100, y: 35, width: 200, height: 30))
        self.yuyueNum.text = "预约次数:" + "\(num)"
        self.des = UILabel(frame: CGRect(x: 10, y: 60, width: SCREEN_WIDTH - 10, height: 30))
       self.des.text = des
        self.des.textColor = UIColor.black
        self.detailBtn = UIButton(frame: CGRect(x: 10, y: 100, width: SCREEN_WIDTH / 2 - 10, height: 30))
        self.detailBtn.addTarget(self, action: #selector(CusActionView.detail), for: .touchUpInside)
        self.detailBtn.setBackgroundImage(UIImage(named:"coach_details_btn"), for: .normal)
        self.yuyeBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH / 2 + 10, y: 100, width: SCREEN_WIDTH / 2 - 10, height: 30))
        self.detailBtn.setTitle("教练详情", for: .normal)
        self.detailBtn.setTitleColor(UIColor.white, for: .normal)
        self.yuyeBtn.setTitle("课程预约", for: .normal)
        self.yuyeBtn.setTitleColor(UIColor.black, for: .normal)
        self.yuyeBtn.setBackgroundImage(UIImage(named:"btn_myorder_grey"), for: .normal)
        self.yuyeBtn.addTarget(self, action: #selector(CusActionView.yuyue), for: .touchUpInside)
        bottomView?.addSubview(self.head)
        bottomView?.addSubview(self.name)
        bottomView?.addSubview(yuyueNum)
        bottomView?.addSubview(self.des)
        bottomView?.addSubview(self.detailBtn)
        bottomView?.addSubview(yuyeBtn)
        bottomView?.addSubview(starImageView)
      self.addSubview(self.bottomView!)
        
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func detail() {
        self.delegate?.detail()
    }
    func yuyue() {
        self.delegate?.yuyue()
    }
    func show() {
       
         self.addSubview(self.MasView!)
    UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: UIViewKeyframeAnimationOptions.calculationModeLinear, animations: {
        self.bottomView?.frame = CGRect(x: 0, y: SCREEN_HEIGHT - 150, width: SCREEN_WIDTH, height:150)
       
        
    }) { (finish:Bool) in
       
           self.MasView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CusActionView.resign)))
        self.bottomView?.backgroundColor = UIColor.white
        self.bottomView?.alpha = 1.0
        self.MasView?.backgroundColor = UIColor.black
        self.MasView?.alpha = 0.5
        self.bringSubview(toFront: self.bottomView!)
  
            self.navigationBar?.backgroundColor = UIColor.black
            self.navigationBar?.alpha = 0.5
        if(self.isTab)!{
            let app = UIApplication.shared.delegate as! AppDelegate
            app.slide?.tabBar.myView?.isHidden = true
        }
        }
    
    
    
    }
    
    func resign() {
        UIView.animateKeyframes(withDuration: 0.3, delay: 0, options: UIViewKeyframeAnimationOptions.calculationModeLinear, animations: {
            self.bottomView?.frame = CGRect(x: 0, y: SCREEN_HEIGHT, width: SCREEN_WIDTH, height:150)
            
            
        }) { (finish:Bool) in
          self.removeFromSuperview()
            if(self.isTab)!{
                let app = UIApplication.shared.delegate as! AppDelegate
                app.slide?.tabBar.myView?.isHidden = false
            }
           
                self.navigationBar?.backgroundColor = UIColor.clear
                self.navigationBar?.alpha = 1
            
        }
        

    }
   
   }
