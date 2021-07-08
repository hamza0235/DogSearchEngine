//
//  OnebyteNetworkSessionManager.swift
//  swift-api-cycle
//
//  Created by Humayun Sohail on 1/12/17.
//  Copyright © 2017 Humayun Sohail. All rights reserved.
//

import Foundation
import Alamofire

open class OnebyteNetworkSessionManager : Session{
    
    //MARK: Class Variables
    //static public let sharedInstance = OnebyteNetworkSessionManager()
    
    class public func request(_ urlRequest: URLRequestConvertible) -> DataRequest {
      
        return AF.request(urlRequest)
    }
    
    class public func requestWithEncoding (_ url: URLConvertible, Method method : HTTPMethod , Parameteres parameters : Parameters , Encoding encoding : ParameterEncoding , Headers headers : HTTPHeaders?) -> DataRequest
    {
        return AF.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
    
    
   
    
    
}
