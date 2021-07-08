//
//  DogListViewController + TableViewController.swift
//  DogAPITestProject
//
//  Created by Hamza on 08/07/2021.
//

import Foundation
import UIKit

extension DogListViewController : UITableViewDataSource , UITableViewDelegate
{
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard self.dogBreedArray != nil else {
            return 0
        }
        
        return self.dogBreedArray!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style:UITableViewCell.CellStyle.default,reuseIdentifier:"dogCell")
        cell.textLabel!.text = self.dogBreedArray![indexPath.row].name
        return cell

}
    
    
}
