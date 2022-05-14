//
//  AllSportsCollectionViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/14/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

class AllSportsCollectionViewController: UICollectionViewController {

    let dataSource : [String] = ["Egypt", "Germany", "France", "England", "Palstine", "Iraq", "NetharLand", "Poland", "Sudia", "Japan", "China"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    
    }

     


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       /* let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell*/
        var cell =  UICollectionViewCell()
        
        if let sportCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? SportsCollectionViewCell {
            sportCell.configrationCellLabel(with: dataSource[indexPath.row])
            print("sddsdssd")
            print(dataSource[indexPath.row])
            cell = sportCell
            
        }
        
        return cell
    }


}
