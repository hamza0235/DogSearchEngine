//
//  AppAPIManager.swift
//  DogAPITestProject
//
//  Created by Hamza on 08/07/2021.
//

import Foundation


class AppAPIManager {
    
    //MARK:- SINGELTON CLASS
    static let shared: AppAPIManager = {
        let instance = AppAPIManager()
        return instance
    }()
    
    private init(){}
    
    
    
    //MARK:- FETCH DOG BREED
    func fetchDogBreed(SuccessBlock successBlock: @escaping ((_ successResponse: [Dog] ) -> Void), FailureBlock failureBlock: @escaping ((_ error: Error?) -> Void))
    {
        weak var weakSelf = self
        let dogSearchOperation = DogSearchOperation(FirstName: "temp")
        dogSearchOperation.didFinishSuccessfullyCallback = {
            response in
            
            do {
                // set Dog JSON data to Model Array
                let jsonData = try JSONSerialization.data(withJSONObject: response, options: JSONSerialization.WritingOptions.prettyPrinted)
                let decoder = JSONDecoder()
                let dogList = try decoder.decode([Dog].self, from:
                                                        jsonData as Data)
                successBlock(dogList)
                
                }
            catch let parsingError
                {
              
                failureBlock(parsingError)
                }
           
           }
        
        dogSearchOperation.didFinishWithErrorCallback = {
            error in
          failureBlock(error)
        }
        OnebyteNetworkOperationQueue.sharedInstance.addOperation(dogSearchOperation)
    }
    
    
    
}
