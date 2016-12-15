//
//  CityViewController.swift
//  xiaobaxuecheProject
//
//  Created by hznucai on 2016/12/12.
//  Copyright © 2016年 hznucai. All rights reserved.
//

import UIKit
protocol Send {
    func send(value:String)
}
class CityViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{
    @IBOutlet weak var tableView:UITableView!
    var cities = NSArray()
    let hotCities = ["杭州","金华","宁波","上海"]
    var loca = "杭州"
    var sel = ""
    let titles = ["已选城市","定位城市","热门城市","所有城市"]
    var delegate:Send?
    
    override func viewDidLoad() {
        super.viewDidLoad()
self.tableView.delegate = self
self.tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.automaticallyAdjustsScrollViewInsets = false
        self.title = "选择城市"
     
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        
        //从plist文件读取
        let plistPath = Bundle.main.path(forResource: "citys", ofType: "plist")
        let dic = NSMutableDictionary(contentsOfFile: plistPath!)
       self.cities = dic?.value(forKey: "cities") as! NSArray
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0,1,2:
            return 1
        case 3:
            return self.cities.count
        default: break
           
        }
 return 0
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return titles[section]
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "selcell")
            cell.accessoryType = .checkmark
            cell.textLabel?.text = sel
            cell.textLabel?.textColor = UIColor.green
            return cell
        case 1:
            let cell = UITableViewCell(style: .default, reuseIdentifier: "loccell")
            cell.textLabel?.text = "杭州"
            return cell
        case 2:
            let id = "hotCityCell"
            let cell = tableView.dequeueReusableCell(withIdentifier: id) as! CusCityTableViewCell
            cell.hangzhouBtn.addTarget(self, action: #selector(CityViewController.selCity), for: .touchUpInside)
             cell.jinghuaBtn.addTarget(self, action: #selector(CityViewController.selCity), for: .touchUpInside)
             cell.ningboBtn.addTarget(self, action: #selector(CityViewController.selCity), for: .touchUpInside)
             cell.shanghaiBtn.addTarget(self, action: #selector(CityViewController.selCity), for: .touchUpInside)
            return cell
        case 3:
            let identifer = "allCitiesCell"
            var cell : UITableViewCell? = tableView.dequeueReusableCell(withIdentifier:(identifer))
            
            if cell == nil {
                cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: identifer)
            }
            cell?.textLabel?.text = self.cities[indexPath.row] as? String
            return cell!

        default:
            break
        }
    return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.section {
            
        case 0:break
        case 1: self.delegate?.send(value: self.loca)
        _ = navigationController?.popViewController(animated: true)

        case 2:break
        case 3:
            let sel = self.cities[indexPath.row]
            self.delegate?.send(value: sel as! String)
            _ = navigationController?.popViewController(animated: true)
            
            
        default:
            break
        }
    }
    //选择了某项
    func selCity(sender:UIButton){
       
        self.delegate?.send(value: (sender.titleLabel?.text)!)
        _ = navigationController?.popViewController(animated: true)

    }
    override func viewWillAppear(_ animated: Bool) {
        let app = UIApplication.shared.delegate  as! AppDelegate
        app.slide?.tabBar.myView?.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        let app = UIApplication.shared.delegate  as! AppDelegate
        app.slide?.tabBar.myView?.isHidden = false
    }
}
