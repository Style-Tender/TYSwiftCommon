//
//  TYHttpHelper.swift
//  TYSwiftCommon
//
//  Created by Dou Guangzheng on 2020/12/15.
//

import UIKit
import Alamofire

public typealias HttpSuccess = (_ responseObject : Any) -> ()
public typealias HttpFailure = (_ error : Error,_ system : Bool) -> ()
public typealias HttpComplete = (_ success : Bool) -> ()

public class TYHttpHelper: NSObject {
    /// Get请求
    /// - Parameters:
    ///   - url: 请求地址
    ///   - parameters: 参数，默认nil
    ///   - headers: 请求头
    ///   - success: 成功回调
    ///   - failure: 失败回调
    ///   - complete: 请求结束回调
    public class func GET(url:String,
                   parameters:[String:Any]? = nil,
                   headers:[String:String]? = nil,
                   success:HttpSuccess? = nil,
                   failure:HttpFailure? = nil,
                   complete:HttpComplete? = nil){
        var log = """
\n------------------------>>>> 网络请求 <<<<------------------------
开始网络请求 GET------>>>>
请求URL:\(url)
请求参数Params：
\(String(describing: parameters))
请求头Header：
\(String(describing: headers))
------------------------>>>> 网络请求 <<<<------------------------
"""
        TYLog(message:log)
        var header : HTTPHeaders? = nil
        
        if headers != nil {
            header = HTTPHeaders.init(headers!)
        }
        
        AF.request(url,parameters: parameters, headers: header).responseJSON { (response) in
            switch response.result {
            
            case .success(let json):
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    GET HTTP OK : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    返回数据:
                    \(json)
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    GET HTTP ERROR : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    ERROR:
                    \(String(error.responseCode ?? -1) + error.localizedDescription))
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
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
    public class func POST(url:String,
                    parameters:[String:Any]? = nil,
                    headers:[String:String]? = nil,
                    success:HttpSuccess? = nil,
                    failure:HttpFailure? = nil,
                    complete:HttpComplete? = nil) {
        var log = """
\n------------------------>>>> 网络请求 <<<<------------------------
开始网络请求 POST------>>>>
请求URL:\(url)
请求参数Params：
\(String(describing: parameters))
请求头Header：
\(String(describing: headers))
------------------------>>>> 网络请求 <<<<------------------------
"""
        TYLog(message:log)
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
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    POST HTTP OK : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    返回数据:
                    \(json)
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    POST HTTP ERROR : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    ERROR:
                    \(String(error.responseCode ?? -1) + error.localizedDescription))
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
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
    public class func POST_RAW(url:String,
                    parameters:[String:Any]? = nil,
                    headers:[String:String]? = nil,
                    success:HttpSuccess? = nil,
                    failure:HttpFailure? = nil,
                    complete:HttpComplete? = nil) {
        var log = """
\n------------------------>>>> 网络请求 <<<<------------------------
开始网络请求 POST_RAW------>>>>
请求URL:\(url)
请求参数Params：
\(String(describing: parameters))
请求头Header：
\(String(describing: headers))
------------------------>>>> 网络请求 <<<<------------------------
"""
        TYLog(message:log)
        
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
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    POST_RAW HTTP OK : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    返回数据:
                    \(json)
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    POST_RAW HTTP ERROR : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    ERROR:
                    \(String(error.responseCode ?? -1) + error.localizedDescription))
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
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
    public class func PUT(url:String,
                    parameters:[String:Any]? = nil,
                    headers:[String:String]? = nil,
                    success:HttpSuccess? = nil,
                    failure:HttpFailure? = nil,
                    complete:HttpComplete? = nil) {
        var log = """
\n------------------------>>>> 网络请求 <<<<------------------------
开始网络请求 PUT------>>>>
请求URL:\(url)
请求参数Params：
\(String(describing: parameters))
请求头Header：
\(String(describing: headers))
------------------------>>>> 网络请求 <<<<------------------------
"""
        TYLog(message:log)
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
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    PUT HTTP OK : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    返回数据:
                    \(json)
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    PUT HTTP ERROR : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    ERROR:
                    \(String(error.responseCode ?? -1) + error.localizedDescription))
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
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
    public class func DELETE(url:String,
                    parameters:[String:Any]? = nil,
                    headers:[String:String]? = nil,
                    success:HttpSuccess? = nil,
                    failure:HttpFailure? = nil,
                    complete:HttpComplete? = nil) {
        var log = """
\n------------------------>>>> 网络请求 <<<<------------------------
开始网络请求 DELETE------>>>>
请求URL:\(url)
请求参数Params：
\(String(describing: parameters))
请求头Header：
\(String(describing: headers))
------------------------>>>> 网络请求 <<<<------------------------
"""
        TYLog(message:log)
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
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    DELETE HTTP OK : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    返回数据:
                    \(json)
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
                if success != nil {
                    success!(json)
                }
                
                if complete != nil {
                    complete!(true)
                }
                
            case .failure(let error):
                log = """
                    \n------------------------>>>> 网络请求 <<<<------------------------
                    DELETE HTTP ERROR : \(String(response.response?.statusCode ?? -1))
                    请求URL: \(response.response?.url?.absoluteString ?? "")
                    请求参数Params：
                    \(String(describing: parameters))
                    请求头Header：
                    \(String(describing: headers))
                    ERROR:
                    \(String(error.responseCode ?? -1) + error.localizedDescription))
                    ------------------------>>>> 网络请求 <<<<------------------------
                    """
                TYLog(message: log)
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
