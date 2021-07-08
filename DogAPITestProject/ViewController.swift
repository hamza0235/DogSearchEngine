//
//  ViewController.swift
//  DogAPITestProject
//
//  Created by Hamza on 07/07/2021.
//

import UIKit


class DogListViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    
    private var dogBreedArray : [Dog]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setDefaultValues()
        self.fetchDogBreeds()
    }
    
    
    //MARK: SET DEFAULT VALUES
    func setDefaultValues ()
    {
        self.dogBreedArray = [Dog]()
    }
    
    //MARK: ANIMATION
    func runLottieAnimation()
    {
        LottieManager.shared.runDogAnimation(animationParentView: self.view)
    }

    
    //MARK: FETCH DOG BREED METHOD
    func fetchDogBreeds()
    {
        self.runLottieAnimation()
        AppAPIManager.shared.fetchDogBreed(SuccessBlock : {
            [weak self] (successResponse) in
            
            LottieManager.shared.stopAnimation()
            
            do {
                
            let jsonData = try JSONSerialization.data(withJSONObject: successResponse, options: JSONSerialization.WritingOptions.prettyPrinted)
            let decoder = JSONDecoder()
            self!.dogBreedArray = try decoder.decode([Dog].self, from:
                                                    jsonData as Data)
              } catch let parsingError {
                print("Error", parsingError)
            }
           
            }, FailureBlock: {
            
            [weak self] (error) in
            LottieManager.shared.stopAnimation()
            
        })
       
        
    }
    
    

}

