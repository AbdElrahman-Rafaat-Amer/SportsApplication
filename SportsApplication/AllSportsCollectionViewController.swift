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
    title = "All Sports"
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      
        var cell =  UICollectionViewCell()
        
        if let sportCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? SportsCollectionViewCell {
            sportCell.configrationCellLabel(with: dataSource[indexPath.row])
            print("collection view \(dataSource[indexPath.row])")
            cell = sportCell
        }
        
        return cell
    }

    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Sport \(dataSource[indexPath.row])")
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSize = (collectionView.frame.size.width - 48) / 2
        return CGSize(width: widthSize, height:180)
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
}

