//
//  ClosureUse.swift
//  MySwift
//
//  Created by macpro on 2016/11/22.
//  Copyright © 2016年 macpro. All rights reserved.
//闭包的使用

import UIKit

class ClosureUse: NSObject {

    //MARK: - closure
    let names = ["Chris", "Alex", "Ewa", "Barry", "Daniella"]
    
    
    func backward(_ s1: String, _ s2: String) -> Bool {
        return s1 > s2
    }
    
    let closure = {(s1:String,s2:String)->Bool in return s1>s2}
    
    func startSort() -> Void {
        let reversedNames = names.sorted(by: backward)
        print(reversedNames)
    }
    func startSort1() -> Void {
        let reversedNames = names.sorted(by: closure)
        print(reversedNames)
    }
    
}
