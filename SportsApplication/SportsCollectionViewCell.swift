//
//  SportsCollectionViewCell.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/14/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

class SportsCollectionViewCell: UICollectionViewCell {
    
   // @IBOutlet private weak var sportsNameLabel: UILabel!
   
    @IBOutlet weak var sportsNameLabel: UILabel!
    @IBOutlet weak var sportsImageView: UIImageView!
    
    func configrationCellLabel(with sportName : String){
        print("sportName")
        print(sportName)
        sportsImageView.image = UIImage(named: "Image")
        sportsNameLabel.text = sportName
        print("after assign")
        print(sportsNameLabel.text ?? "defult")
    }
}
