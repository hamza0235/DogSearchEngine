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
    
    
    var dogBreedArray : [Dog]?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.setDefaultValues()
        self.fetchDogBreeds()
    }
    
    
    //MARK:- SET DEFAULT VALUES
    func setDefaultValues ()
    {
        self.dogBreedArray = [Dog]()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        searchBar.delegate = self
       
        tableView.reloadData()
    }
    
    //MARK:- ANIMATION
    func runLottieAnimation()
    {
        LottieManager.shared.runDogAnimation(animationParentView: self.view)
    }

    
    //MARK:- FETCH DOG BREED METHOD
    func fetchDogBreeds()
    {
        self.runLottieAnimation()
        AppAPIManager.shared.fetchDogBreed(SuccessBlock : {
            [weak self] (successResponse) in
            
            LottieManager.shared.stopAnimation()
            
            self!.dogBreedArray = successResponse
            self!.tableView.reloadData()
           
            }, FailureBlock: {
            
            [weak self] (error) in
            LottieManager.shared.stopAnimation()
            
        })
       
        
    }
    
    

}

