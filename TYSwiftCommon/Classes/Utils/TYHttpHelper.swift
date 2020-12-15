//
//  TYHttpHelper.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit
import Alamofire

typealias HttpSuccess = (_ responseObject : Any) -> ()
typealias HttpFailure = (_ error : Error,_ system : Bool) -> ()
typealias HttpComplete = (_ success : Bool) -> ()

class TYHttpHelper: NSObject {
    /// Get请求
    /// - Parameters:
    ///   - url: 请求地址
    ///   - parameters: 参数，默认nil
    ///   - headers: 请求头
    ///   - success: 成功回调
    ///   - failure: 失败回调
    ///   - complete: 请求结束回调
    class func GET(url:String,
                   parameters:[String:Any]? = nil,
                   headers:[String:String]? = nil,
                   success:HttpSuccess? = nil,
                   failure:HttpFailure? = nil,
                   complete:HttpComplete? = nil) {
        
        TYLog(message: "开始网络请求 GET------>>>>")
        TYLog(message: "请求URL:" + url)
        TYLog(message: "请求参数Params：")
        TYLog(message: parameters)
        TYLog(message: "请求头Header：")
        TYLog(message: headers)
        
        var header : HTTPHeaders? = nil
        
        if headers != nil {
            header = HTTPHeaders.init(headers!)
        }
        
        AF.request(url,parameters: parameters, headers: header).responseJSON { (response) in
            switch response.result {
            
            case .success(let json):
                
                TYLog(message: "GET HTTP OK <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "返回数据:")
                TYLog(message: json)
                
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                
                TYLog(message: "GET HTTP ERROR <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "ERROR:" + String(error.responseCode ?? -1) + error.localizedDescription)
                
                if failure != nil {
                    failure!(error,true)
                }
                
                if complete != nil {
                    complete!(false)
                }
                
            }
        }
    }
    
    /// POST请求
    /// - Parameters:
    ///   - url: 请求地址
    ///   - parameters: 参数，默认nil
    ///   - headers: 请求头
    ///   - success: 成功回调
    ///   - failure: 失败回调
    ///   - complete: 请求结束回调
    class func POST(url:String,
                    parameters:[String:Any]? = nil,
                    headers:[String:String]? = nil,
                    success:HttpSuccess? = nil,
                    failure:HttpFailure? = nil,
                    complete:HttpComplete? = nil) {
        
        TYLog(message: "开始网络请求 POST------>>>>")
        TYLog(message: "请求URL:" + url)
        TYLog(message: "请求参数Params：")
        TYLog(message: parameters)
        TYLog(message: "请求头Header：")
        TYLog(message: headers)
        
        var header : HTTPHeaders? = nil
        
        if headers != nil {
            header = HTTPHeaders.init(headers!)
        }
        
        AF.request(url,
                   method:.post,
                   parameters: parameters,
                   headers: header
        ).responseJSON { (response) in
            switch response.result {
            
            case .success(let json):
                
                TYLog(message: "POST HTTP OK <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "返回数据:")
                TYLog(message: json)
                
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                
                TYLog(message: "POST HTTP ERROR <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "ERROR:" + String(error.responseCode ?? -1) + error.localizedDescription)
                
                if failure != nil {
                    failure!(error,true)
                }
                
                if complete != nil {
                    complete!(false)
                }
                
            }
        }
        
    }
    
    /// RAW POST请求
    /// - Parameters:
    ///   - url: 请求地址
    ///   - parameters: 参数，默认nil
    ///   - headers: 请求头
    ///   - success: 成功回调
    ///   - failure: 失败回调
    ///   - complete: 请求结束回调
    class func POST_RAW(url:String,
                    parameters:[String:Any]? = nil,
                    headers:[String:String]? = nil,
                    success:HttpSuccess? = nil,
                    failure:HttpFailure? = nil,
                    complete:HttpComplete? = nil) {
        
        TYLog(message: "开始网络请求 POST_RAW------>>>>")
        TYLog(message: "请求URL:" + url)
        TYLog(message: "请求参数Params：")
        TYLog(message: parameters)
        TYLog(message: "请求头Header：")
        TYLog(message: headers)
        
        var header : HTTPHeaders? = nil
        
        if headers != nil {
            header = HTTPHeaders.init(headers!)
        }
        
        AF.request(url,
                   method:.post,
                   parameters: parameters,
                   encoding: JSONEncoding.default,
                   headers: header
        ).responseJSON { (response) in
            switch response.result {
            
            case .success(let json):
                
                TYLog(message: "POST_RAW HTTP OK <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "返回数据:")
                TYLog(message: json)
                
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                
                TYLog(message: "POST_RAW HTTP ERROR <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "ERROR:" + String(error.responseCode ?? -1) + error.localizedDescription)
                
                if failure != nil {
                    failure!(error,true)
                }
                
                if complete != nil {
                    complete!(false)
                }
                
            }
        }
        
    }
    
    /// PUT请求
    /// - Parameters:
    ///   - url: 请求地址
    ///   - parameters: 参数，默认nil
    ///   - headers: 请求头
    ///   - success: 成功回调
    ///   - failure: 失败回调
    ///   - complete: 请求结束回调
    class func PUT(url:String,
                    parameters:[String:Any]? = nil,
                    headers:[String:String]? = nil,
                    success:HttpSuccess? = nil,
                    failure:HttpFailure? = nil,
                    complete:HttpComplete? = nil) {
        
        TYLog(message: "开始网络请求 PUT------>>>>")
        TYLog(message: "请求URL:" + url)
        TYLog(message: "请求参数Params：")
        TYLog(message: parameters)
        TYLog(message: "请求头Header：")
        TYLog(message: headers)
        
        var header : HTTPHeaders? = nil
        
        if headers != nil {
            header = HTTPHeaders.init(headers!)
        }
        
        AF.request(url,
                   method:.put,
                   parameters: parameters,
                   headers: header
        ).responseJSON { (response) in
            switch response.result {
            
            case .success(let json):
                
                TYLog(message: "PUT HTTP OK <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "返回数据:")
                TYLog(message: json)
                
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                
                TYLog(message: "PUT HTTP ERROR <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "ERROR:" + String(error.responseCode ?? -1) + error.localizedDescription)
                
                if failure != nil {
                    failure!(error,true)
                }
                
                if complete != nil {
                    complete!(false)
                }
                
            }
        }
        
    }
    
    /// DELETE请求
    /// - Parameters:
    ///   - url: 请求地址
    ///   - parameters: 参数，默认nil
    ///   - headers: 请求头
    ///   - success: 成功回调
    ///   - failure: 失败回调
    ///   - complete: 请求结束回调
    class func DELETE(url:String,
                    parameters:[String:Any]? = nil,
                    headers:[String:String]? = nil,
                    success:HttpSuccess? = nil,
                    failure:HttpFailure? = nil,
                    complete:HttpComplete? = nil) {
        
        TYLog(message: "开始网络请求 DELETE------>>>>")
        TYLog(message: "请求URL:" + url)
        TYLog(message: "请求参数Params：")
        TYLog(message: parameters)
        TYLog(message: "请求头Header：")
        TYLog(message: headers)
        
        var header : HTTPHeaders? = nil
        
        if headers != nil {
            header = HTTPHeaders.init(headers!)
        }
        
        AF.request(url,
                   method:.delete,
                   parameters: parameters,
                   headers: header
        ).responseJSON { (response) in
            switch response.result {
            
            case .success(let json):
                
                TYLog(message: "DELETE HTTP OK <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "返回数据:")
                TYLog(message: json)
                
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                
                TYLog(message: "DELETE HTTP ERROR <<<<<<<-------- " + String(response.response?.statusCode ?? -1))
                TYLog(message: "请求URL:" + (response.response?.url?.absoluteString ?? ""))
                TYLog(message: "ERROR:" + String(error.responseCode ?? -1) + error.localizedDescription)
                
                if failure != nil {
                    failure!(error,true)
                }
                
                if complete != nil {
                    complete!(false)
                }
                
            }
        }
    }
}
