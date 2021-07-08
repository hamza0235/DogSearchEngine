//
//  DogSearchOperation.swift
//  DogAPITestProject
//
//  Created by Hamza on 08/07/2021.
//

import Foundation


class DogSearchOperation: OnebyteNetworkOperationBase {
    
    
    //MARK:- Instance Variables
    var searchText: String
    
    init(FirstName searchText: String  ) {
    self.searchText = searchText
    }
    
    //MARK:- Overridden Methods
    override func start() {
        super.start()
        
        self.startOperation()
    }
    
    override func handleDidFinishedWithResponse(response: AnyObject!) {
       
        self.safeCallDidFinishSuccessfullyCallback(responseObject: response)
        self.handleDidFinishedCommon()
    }
    
    override func handleDidFinishedWithError(error: Error!) {
        self.safeCallDidFinishWithErrorCallback(error: error)
    }
    
    //MARK:- Request
    private func startOperation() {
        
        let endPointURL:String = AppNetworkEndPoints.dogBreeds
        
        OnebyteNetworkSessionManager.request(AppNetworkManager.networkRequest(methodType: .get, path: endPointURL, parameters:nil)).responseJSON {response in
            
            if ((response.response?.statusCode) == 200){
                switch response.result {
                case .success(let data):
                    self.handleDidFinishedWithResponse(response: data as AnyObject?)
                    break
                case .failure(let error):
                    self.handleDidFinishedWithError(error: error)
                    break
                }
            }else{
                self.handleDidFinishedWithError(error: response.error)
            }
        }
    }
    
    private func createBody() -> Dictionary<String, String>{
        return [
            "q":     self.searchText
        ]
    }
}

    
    
    
    
    
    
    


