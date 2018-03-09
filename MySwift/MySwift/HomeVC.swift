//
//  HomeVC.swift
//  PBOCUse
//
//  Created by macpro on 16/4/11.
//  Copyright © 2016年 macpro. All rights reserved.
//
enum practiceResult{
    case success
    case failed
    case unknow
}
@objc public protocol HomeVCDelegate:NSObjectProtocol {
    @objc optional func homeChange(_ name:String,location:String)

}
//typealias 等价于 typedef
//给闭包起一个别名
typealias CarClosure = (String)->Void



import UIKit

 class HomeVC: UIViewController {
    
    weak internal var delegate: HomeVCDelegate?
    
    var carClosure:CarClosure!
    
    override  func viewDidLoad() {
        super.viewDidLoad()
        self.title = "HomeVC";
        self.view.backgroundColor = UIColor.white
        let  btn = UIButton.init(type: .system)
        btn .setTitle("开始搬家", for: UIControlState())
        btn .addTarget(self, action: #selector(HomeVC.change), for: .touchUpInside)
//        btn .setTitleColor(UIColor.blueColor(), forState: UIControlState.Normal)
        btn.frame = CGRect(x: 20, y: 80, width: 100, height: 60)
        self.view.addSubview(btn)
        
        
       
    }
    
    func change () -> Void {
        
        //代理
        self.delegate!.homeChange!("李梅",location: "搬到浦东")
        
        //闭包
        if (carClosure != nil) {
            carClosure("奔驰")
        }
    }
    
    //类似于block 逃逸闭包
    func goHomeByCar(car:@escaping CarClosure) -> Void {
        self.carClosure = car
    }
    
    override  func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
