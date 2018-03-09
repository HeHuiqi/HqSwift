//
//  ViewController.swift
//  PBOCUse
//
//  Created by macpro on 16/4/7.
//  Copyright © 2016年 macpro. All rights reserved.
//

import UIKit
import Foundation
class MainVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "MainVC";
        self.view.backgroundColor = UIColor.white
      
        let  header = 0
        let param = NSDictionary();
        
        HqHttpClient.startRequest(header as AnyObject, urlString: "http://www.weather.com.cn/data/sk/101010100.html", param: param as! Dictionary<String, String>, method: "GET") { (responseData, resp) in
                print("返回数据==",responseData!)
            
        }
        
       let closure1 = {(str:String)->String in
            
            return str+"--nihao";
        }
        let str = closure1("hehuiqi");
        
        
        
        print("str === "+str);
        /*
        print("---------------------------------------------------")

        let names = ["Anna", "Alex", "Brian", "Jack"]
        
//        var  ni = Array.init(arrayLiteral: "你","你","你","你");
        
        var myAr = [String]()
        myAr.append("kkk");
        print(myAr)
        for name in names {
            print("Hello line, \(name)!")
        }
        print("---------------------------------------------------")
        
        
        for (index,value) in names.enumerated() {
            print(index,value)
        }
        print("---------------------------------------------------")
        let str = "我的时间"
        for character in str.characters {
            print(character);
        }
        print("---------------------------------------------------")

       
        let string = [String](repeating: "test",count: 4)
        print(string)
        print("---------------------------------------------------")

        //字典
        var mydic = ["name":"jick","age":"13"]
        var dicEmpty = [String:String]()
        dicEmpty.updateValue("她", forKey: "nihao")
        print("dicEmpty==",dicEmpty)
        var mydic1 = Dictionary<String,String>.init(minimumCapacity: 0);
        mydic1.updateValue("我", forKey: "nihao")
        print("mydic==",mydic)
        print("mydic1==",mydic1)

        mydic["name"] = "tom"
        print("mydic==",mydic)
        mydic.updateValue("25", forKey: "age")
        print("mydic==",mydic)
        mydic.removeValue(forKey: "age");
        print("mydic==",mydic)
        print("---------------------------------------------------")

        eatEgg(eggNumber: 10)

        let mathFunction: (Int, Int) -> Int = addTwoInts
        print("Result: \(mathFunction(2, 3))")
        printMathResult(addTwoInts, a: 3, b: 5)
        
        run({ (time, meil, suc) in
            
            print("time==\(time),meil==\(meil),suc==\(suc)")
            }, success: true)
        
        let bibaoUse = BiBaoUse()
        let arr=bibaoUse.GetList([1,2,3,4],pre: {(s:Int) in return s>2})
        print("arr----",arr);*/
    }
    
    func addTwoInts(_ a: Int, b: Int) -> Int {
        return a + b
    }
    //第一个eggNumber外部参数名 第二个eggNumber内部参数名
    func eatEgg(eggNumber:Int)  {
        print("吃了\(eggNumber)个鸡蛋")
    }
    
    //闭包的一种实现
    func run (_ runReuslut:(_ time:Int,_ meil:Int,_ suc:Bool)->Void,success:Bool) -> Void {
        
        runReuslut(9,10,success);
        
    }
    
    func printMathResult(_ mathFunction: (Int, Int) -> Int, a: Int, b: Int) {
        
        
        print("Result: \(mathFunction(a, b))")
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

