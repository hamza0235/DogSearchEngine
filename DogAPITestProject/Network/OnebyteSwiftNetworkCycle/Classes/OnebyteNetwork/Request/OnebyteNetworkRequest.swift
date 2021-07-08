//
//  AppNetworkConstants.swift
//  swift-api-cycle
//
//  Created by Humayun Sohail on 1/13/17.
//  Copyright © 2017 Humayun Sohail. All rights reserved.
//

import Foundation
import Alamofire

public class OnebyteNetworkRequest {
    static public var baseURLString: String!
    static public var OAuthToken: String?
    static public var method: Alamofire.HTTPMethod?
    static public var path: String?
    
    static public var parameters: [String : Any]?
    
    static public var headers: [String : String]?
    
    
    class public func InitiateRequest() -> URLRequestConvertible {
        let url = URL(string: OnebyteNetworkRequest.baseURLString)!
       
        
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(OnebyteNetworkRequest.path!))
        
       
         print("Complete URL is ",url.appendingPathComponent(OnebyteNetworkRequest.path!))
        switch OnebyteNetworkRequest.method! {
        case .get:
            urlRequest.httpMethod = "GET"
            
        case .put:
            urlRequest.httpMethod = "PUT"
        case .post:
            urlRequest.httpMethod = "POST"
        case .delete:
            urlRequest.httpMethod = "DELETE"
        default:
            urlRequest.httpMethod = "GET"
        }
        
        urlRequest.allHTTPHeaderFields = OnebyteNetworkRequest.headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        if !(OnebyteNetworkRequest.path?.contains( AppNetworkEndPoints.kCalendarJobs))!{
//            if let params = OnebyteNetworkRequest.parameters{
//                OnebyteNetworkRequest.parameters = params.merging( [
//                    "limit": "10",
//                    "offset": "0"
//                    ], uniquingKeysWith:
//                    { (first, _) in first })
//            }else{
//                OnebyteNetworkRequest.parameters = [
//                    "limit": "10",
//                    "offset": "0"
//                ]
//            }
//        }else{
//            
//        }
        if OnebyteNetworkRequest.method! != .get{
            if let param = OnebyteNetworkRequest.parameters{
            let data = try! JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
            if let json = json {
                print(json)
            }
                urlRequest.httpBody = json!.data(using: String.Encoding.utf8.rawValue);
            }
        }else{
            if let param = OnebyteNetworkRequest.parameters{
            do{
                urlRequest = try URLEncoding.queryString.encode(urlRequest, with: param)
                 //try URLEncoding.default.encode(urlRequest, with: param)
            }catch{
                print("url encoding error")
            }
            }
        }
        
        
        return urlRequest as URLRequestConvertible
    }
    
    
    
    class public func InitiateRequestWithEncodingForPost() -> URLConvertible {
        
        let completePath = OnebyteNetworkRequest.baseURLString + OnebyteNetworkRequest.path!
        let url = URL(string: completePath)!
        
        
        
       // var urlRequest = URLRequest(url: url.appendingPathComponent(OnebyteNetworkRequest.path!))
        
        
       /* print("Complete URL is ",url.appendingPathComponent(OnebyteNetworkRequest.path!))
        switch OnebyteNetworkRequest.method! {
        case .get:
            urlRequest.httpMethod = "GET"
            
        case .put:
            urlRequest.httpMethod = "PUT"
        case .post:
            urlRequest.httpMethod = "POST"
        case .delete:
            urlRequest.httpMethod = "DELETE"
        default:
            urlRequest.httpMethod = "GET"
        }
        
        urlRequest.allHTTPHeaderFields = OnebyteNetworkRequest.headers
        urlRequest.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if OnebyteNetworkRequest.method! != .get{
            if let param = OnebyteNetworkRequest.parameters{
                let data = try! JSONSerialization.data(withJSONObject: param, options: JSONSerialization.WritingOptions.prettyPrinted)
                
                let json = NSString(data: data, encoding: String.Encoding.utf8.rawValue)
                if let json = json {
                    print(json)
                }
                urlRequest.httpBody = json!.data(using: String.Encoding.utf8.rawValue);
            }
        }else{
            if let param = OnebyteNetworkRequest.parameters{
                do{
                    urlRequest = try URLEncoding.queryString.encode(urlRequest, with: param)
                    //try URLEncoding.default.encode(urlRequest, with: param)
                }catch{
                    print("url encoding error")
                }
            }
        }*/
        
        
        return url as URLConvertible
    }


    
}
