//
//  RootVC.swift
//  MySwift
//
//  Created by macpro on 16/1/27.
//  Copyright © 2016年 macpro. All rights reserved.
//
//声明协议后必须实现必要的协议方法


import UIKit

class RootVC: UIViewController,UITableViewDelegate,UITableViewDataSource,HomeVCDelegate {

    var tableView:UITableView?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "RootVC";
        tableView = UITableView.init(frame: self.view.frame, style: .grouped);
        tableView?.delegate = self;
        tableView?.dataSource = self;
        self.view.addSubview(tableView!)
      
    
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let  identifier:String = "cell"

        var cell = tableView.dequeueReusableCell(withIdentifier: identifier)
        if ((cell) == nil)
        {
          cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: identifier)
        }
        cell?.textLabel?.text = String("index\(indexPath.row)")
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            do {
                let  homeVC = HomeVC();
                homeVC.delegate = self;
                
                //闭包回调
                homeVC.goHomeByCar { (carName) in
                    print("carName==\(carName)")
                    
                }
                self.navigationController?.pushViewController(homeVC, animated: true)
            }
            break
        case 1:
            do {
            let  manVC = MainVC();
            self.navigationController?.pushViewController(manVC, animated: true)
            }
            break
        default: break
            
        }
       
    }
    
    //MARK: - HomeVCDelegate
    func homeChange(_ name: String, location: String) {
        print("name==\(name),location==\(location)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
}

