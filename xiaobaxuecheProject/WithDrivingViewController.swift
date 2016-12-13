//
//  WithDrivingViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/12.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit

class WithDrivingViewController: UIViewController ,BMKMapViewDelegate,BMKLocationServiceDelegate{
    var locationService = BMKLocationService()
    @IBOutlet weak var mapView:BMKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        mapView.delegate = self
        //添加圆形的覆盖物
        //  locationService.allowsBackgroundLocationUpdates = true
        locationService.startUserLocationService()
        mapView.showsUserLocation = false
        mapView.userTrackingMode = BMKUserTrackingModeNone
        mapView.showsUserLocation = true

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func  viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
        let rightBtn = UIButton(frame: CGRect(x: SCREEN_WIDTH - 50 - 10, y: 20, width: 50, height: 50))
        rightBtn.setBackgroundImage(UIImage(named:"list_btn"), for: .normal)
    self.view.addSubview(rightBtn)
        
        rightBtn.addTarget(self, action: #selector(WithDrivingViewController.showlist), for: .touchUpInside)
        locationService.delegate = self
        mapView.delegate = self
        mapView.viewWillAppear()
        let coor1 = CLLocationCoordinate2DMake(30.3038950000,120.2203000000)
        let annotation = BMKPointAnnotation()
        annotation.coordinate = coor1
        annotation.title = "这里是我"
        
        mapView.addAnnotation(annotation)

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

    func showlist() {
        let learnCarSb = UIStoryboard(name: "LearnCar", bundle: nil)
        let coachListVC = learnCarSb.instantiateViewController(withIdentifier: "CoachListVC") as! CoachListViewController
        self.navigationController?.pushViewController(coachListVC, animated: true)
        coachListVC.title = "陪驾列表"
    }

}
