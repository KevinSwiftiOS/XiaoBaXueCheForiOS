//
//  MapViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/12.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class MapViewController: UIViewController,BMKMapViewDelegate,BMKLocationServiceDelegate,CusDelegate {
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
        //加三个按钮
        let annotation = BMKPointAnnotation()
        annotation.coordinate = coor1
        annotation.title = "这里有教练"
        mapView.addAnnotation(annotation)
//        let coor2 = CLLocationCoordinate2DMake(30.50950000,121.2203000000)
//        //加三个按钮
//        let annotation2 = BMKPointAnnotation()
//        annotation2.coordinate = coor2
//        annotation2.title = "这里有教练"
//        mapView.addAnnotation(annotation2)
    
        listBtn = UIButton(frame:CGRect(x: 0, y: 0, width: 43, height: 43))
        searchBtn = UIButton(frame: CGRect(x: 0, y: 0, width: 43, height: 43))
        searchBtn.setBackgroundImage(UIImage(named:"search_btn"), for: .normal)
        listBtn.setBackgroundImage(UIImage(named:"list_btn"), for: .normal)
    
        searchBtn.addTarget(self, action: #selector(MapViewController.search), for: .touchUpInside)
   
        
        
        listBtn.addTarget(self, action: #selector(MapViewController.listShow), for: .touchUpInside)
      
        let rightListItem = UIBarButtonItem(customView: listBtn)
         let rightSearchItem = UIBarButtonItem(customView: searchBtn)
        self.navigationItem.rightBarButtonItems = [rightListItem,rightSearchItem]
      
         self.navigationController?.navigationBar.backgroundColor = UIColor.clear
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        locationService.delegate = self
        mapView.delegate = nil
        mapView.viewWillDisappear()
     
        
    }
    //自定义精度图
    func customLocationAccuracyCircle(){
        let param = BMKLocationViewDisplayParam()
        
        param.accuracyCircleStrokeColor = UIColor(red: 1, green: 0, blue: 0, alpha: 0.5)
        param.accuracyCircleFillColor = UIColor(red: 0, green: 1, blue: 0, alpha: 0.3)
        mapView.updateLocationView(with: param)
        }
    
    func didUpdateUserHeading(_ userLocation: BMKUserLocation!) {

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
        let cusAction = CusActionView(head: UIImage(named:"ico_客服")!, des: "练车地点", num: 10, name: "曹凯强",isTab:true,navigationBar:(self.navigationController?.navigationBar)!)
        self.view.addSubview(cusAction)
        cusAction.show()
        cusAction.delegate = self
        
}
    //搜索列表
    func search() {
        let sb = UIStoryboard(name: "LearnCar", bundle: nil)
        let searchVC = sb.instantiateViewController(withIdentifier: "SearchVC")
        as! SearchViewController
        self.present(searchVC, animated: true, completion: nil)
    }
    //教练列表
    func listShow(){
        //tabBar消失
           let learnCarSb = UIStoryboard(name: "LearnCar", bundle: nil)
        let coachListVC = learnCarSb.instantiateViewController(withIdentifier: "CoachListVC") as! CoachListViewController
        coachListVC.title = "教练列表"
        self.navigationController?.pushViewController(coachListVC, animated: true)
    }
    @IBAction func tap(sender:UIButton){

          }
    func detail(){
       
    }
    func yuyue() {
      
    }
}
