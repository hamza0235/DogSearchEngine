//
//  AppNetworkManager.swift
//  DogAPITestProject
//
//  Created by Hamza on 07/07/2021.
//

import Foundation
import Alamofire

class AppNetworkManager {
    
    
    // MARK:- Class Variables
    static let sharedInstance = AppNetworkManager()
    
    
    // MARK:- NETWORK REQUEST SETUP
  static func networkRequest (methodType: Alamofire.HTTPMethod!, path: String?, parameters: [String : Any]?) -> URLRequestConvertible {
        OnebyteNetworkRequest.baseURLString = AppNetworkConstants.dogApiBaseURL
        OnebyteNetworkRequest.path = path
        OnebyteNetworkRequest.method = methodType
        OnebyteNetworkRequest.parameters = parameters
        OnebyteNetworkRequest.headers = ["x-api-key": AppNetworkConstants.dogApiKey]
         
        return OnebyteNetworkRequest.InitiateRequest()
    }
    
    
    

}

