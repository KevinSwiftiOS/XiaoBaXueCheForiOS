//
//  MapViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/12.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class MapViewController: UIViewController,BMKMapViewDelegate,BMKLocationServiceDelegate {
    //筛选和列表的btn
    var searchBtn = UIButton()
    var listBtn = UIButton()
    //地图
    var locationService = BMKLocationService()
    @IBOutlet weak var mapView:BMKMapView!
    var grayView = UIView()
    var coachView = UIView()
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        //添加圆形的覆盖物
       //  locationService.allowsBackgroundLocationUpdates = true
    searchBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH - 50 - 50 - 20, y: 20, width: 50, height: 50))
                //开始定位
        locationService.startUserLocationService()
        mapView.showsUserLocation = false
        mapView.userTrackingMode = BMKUserTrackingModeNone
        mapView.showsUserLocation = true
       
       //mapView设置中心
    
    }
    override func didReceiveMemoryWarning() {
        
     }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        locationService.delegate = self
        mapView.delegate = self
        mapView.viewWillAppear()
        let coor1 = CLLocationCoordinate2DMake(30.3038950000,120.2203000000)
        let annotation = BMKPointAnnotation()
        annotation.coordinate = coor1
        annotation.title = "这里是我"
        
        mapView.addAnnotation(annotation)
  
   self.tabBarController?.tabBar.isHidden = false
    self.navigationController?.navigationBar.isHidden = true
        listBtn = UIButton(frame:CGRect(x: SCREEN_WIDTH - 50  - 10, y: 20, width: 50, height: 50))
        searchBtn.setBackgroundImage(UIImage(named:"list_search_btn"), for: .normal)
        listBtn.setBackgroundImage(UIImage(named:"list_btn"), for: .normal)
        searchBtn.addTarget(self, action: #selector(MapViewController.search), for: .touchUpInside)
        listBtn.addTarget(self, action: #selector(MapViewController.listShow), for: .touchUpInside)
        self.view.addSubview(searchBtn)
        self.view.addSubview(listBtn)
      self.navigationController?.navigationBar.isHidden = true
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationService.delegate = self
        mapView.delegate = nil
        mapView.viewWillDisappear()
      self.navigationController?.navigationBar.isHidden = false
        
    }
    //自定义精度图
    func customLocationAccuracyCircle(){
        let param = BMKLocationViewDisplayParam()
        
        param.accuracyCircleStrokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        param.accuracyCircleFillColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3)
        mapView.updateLocationView(with: param)
        }
    
    func didUpdateUserHeading(_ userLocation: BMKUserLocation!) {
//        print("heading is \(userLocation.heading)")
        mapView.updateLocationData(userLocation)
        let coor = userLocation.location.coordinate
        mapView.setCenter(coor, animated: true)
        let circle = BMKCircle(center: coor, radius: 5000)
        mapView.add(circle)
    }
    
    /**
     *用户位置更新后，会调用此函数
     *@param userLocation 新的用户位置
     */
    func didUpdateBMKUserLocation(userLocation: BMKUserLocation!) {
//        print("didUpdateUserLocation lat:\(userLocation.location.coordinate.latitude) lon:\(userLocation.location.coordinate.longitude)")
        mapView.updateLocationData(userLocation)
        let coor = userLocation.location.coordinate
        mapView.setCenter(coor, animated: true)
        //方圆50里的位置画一个圆圈
  
    }
    func mapView(_ mapView: BMKMapView!, viewFor annotation: BMKAnnotation!) -> BMKAnnotationView! {
        if(annotation.isKind(of: BMKPointAnnotation.classForCoder())){
            let newView = BMKPinAnnotationView(annotation: annotation, reuseIdentifier: "myAnnotation")
            newView?.pinColor = UInt(BMKPinAnnotationColorPurple)
            newView?.animatesDrop = true
            newView?.tag = 0
            newView?.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(MapViewController.touch)))
            return newView
        }
        return nil
    }
    func touch(sender:UITapGestureRecognizer){
    grayView = UIView(frame: CGRect(x: 0, y: 0, width: SCREEN_WIDTH, height: SCREEN_HEIGHT - 100))
        coachView = UIView(frame: CGRect(x: 0, y: SCREEN_HEIGHT - 100, width: SCREEN_WIDTH, height: 100))
        grayView.addGestureRecognizer(UITapGestureRecognizer(target: self, action:#selector(MapViewController.resign)))
        coachView.backgroundColor = UIColor.white
        //coachView下面加东西
        let head = UIImageView(frame: CGRect(x: 10, y: 10, width: 50, height: 50))
        head.layer.cornerRadius = 50
        head.layer.masksToBounds = true
        head.image = UIImage(named: "ico_客服")
        let nameLabel = UILabel(frame: CGRect(x: 60, y: 10, width: 100, height: 30))
        nameLabel.text = "王"
        let textView = UITextView(frame: CGRect(x: 10, y: 70, width: 200, height: 30))
        textView.isEditable = false
        textView.text = "练车地点"
        let detailBtn = UIButton(frame: CGRect(x: 0, y: 100, width: 50, height: 30))
        detailBtn.backgroundColor = UIColor.green
        detailBtn.setTitle("教练详情", for: .normal)
        detailBtn.tintColor = UIColor.white
        let courseBtn = UIButton(frame: CGRect(x: 60, y: 100, width: 50, height: 30))
        courseBtn.backgroundColor = UIColor.green
        courseBtn.setTitle("课程预约", for: .normal)
        courseBtn.tintColor = UIColor.white
        coachView.addSubview(head)
        coachView.addSubview(nameLabel)
        coachView.addSubview(textView)
        coachView.addSubview(detailBtn)
        coachView.addSubview(courseBtn)
        
      grayView.backgroundColor = UIColor(colorLiteralRed: 0, green: 0, blue: 0, alpha: 0.868)
        self.view.addSubview(grayView)
        self.view.addSubview(coachView)
        
        
        
      self.tabBarController?.tabBar.isHidden = true
        
          }
    func resign(){
    grayView.removeFromSuperview()
        coachView.removeFromSuperview()
         self.tabBarController?.tabBar.isHidden = false
    }
  //搜索列表
    func search() {
        
    }
    //教练列表
    func listShow(){
        let learnCarSb = UIStoryboard(name: "LearnCar", bundle: nil)
        let coachListVC = learnCarSb.instantiateViewController(withIdentifier: "CoachListVC") as! CoachListViewController
        coachListVC.title = "教练列表"
        self.navigationController?.pushViewController(coachListVC, animated: true)
    }
}
