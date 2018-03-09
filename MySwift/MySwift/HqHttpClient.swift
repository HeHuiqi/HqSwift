//
//  HqHttpClient.swift
//  PBOCUse
//
//  Created by macpro on 16/4/7.
//  Copyright © 2016年 macpro. All rights reserved.
//网络请求

import UIKit

class HqHttpClient: NSObject,URLSessionDataDelegate,URLSessionTaskDelegate {

    //单行单例，初始化方法要私有
    static let sharedInstance = HqHttpClient()
    fileprivate override init() {}
    
//    //单例实现方式2
//    class var sharedInstance1: HqHttpClient {
//        struct Static {
//            static var onceToken: dispatch_once_t = 0
//            static var instance: HqHttpClient? = nil
//        }
//        dispatch_once(&Static.onceToken) {
//            Static.instance = HqHttpClient()
//        }
//        return Static.instance!
//    }
    

   
    class func createMyURLSession() -> URLSession{
    
        let sessionConfig = URLSessionConfiguration.default;
        let urlSession = URLSession.init(configuration: sessionConfig, delegate: HqHttpClient.sharedInstance, delegateQueue: OperationQueue.main)
        
        return urlSession
    }

    
   
    
    //MARK:- 创建请求
    class  func createRequest(_ headers:AnyObject,urlstring:String,method:String,param:AnyObject) -> URLRequest{
        var url:URL?
        var reqeust:URLRequest?
        
        var  json:String = ""
        var jsonData:Data?
        

        if (param.count != 0){
            
            do{
                jsonData = try JSONSerialization.data(withJSONObject: param, options: .prettyPrinted);
                json = (NSString.init(data: jsonData!, encoding:String.Encoding.utf8.rawValue) as  String?)!
                
            }catch{
            
            }
           
        }
        if method == "GET" {
            var urlStr = urlstring;
            urlStr = urlStr + json;
            url = URL.init(string: urlStr)
            reqeust = URLRequest.init(url: url!)
        }else{
            
            url = URL.init(string: urlstring)
            
            reqeust = URLRequest.init(url: url!)
            reqeust?.httpBody = jsonData
        }
        reqeust?.httpMethod = method
        reqeust?.addValue("application/json", forHTTPHeaderField: "Content-Type")
        reqeust?.addValue("application/json", forHTTPHeaderField: "Accept")

        return reqeust!
    }
    //MARK:- 发起请求
    class  func startRequest(_ headers:AnyObject,urlString:String,param:Dictionary<String, String>,method:String,requestComplete:@escaping (_ responseData:NSDictionary?, _ resp:URLResponse?)->Void) -> Void {
        let urlSession = HqHttpClient.createMyURLSession()
        
        let request = HqHttpClient.createRequest(headers, urlstring: urlString, method: method, param: param as AnyObject)

        let  task = urlSession.dataTask(with: request, completionHandler: { (data:Data?, response:URLResponse?, error:Error?) in
         
            do{
              let dic  = try  JSONSerialization.jsonObject(with: data!, options: .mutableLeaves) as! NSDictionary
                requestComplete(dic,response)

            }catch{
            
            }
        }) 
        
        task.resume()
        
        
        print("url==="+urlString)
    }
}
