//
//  SportsCollectionViewCell.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/14/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit
import Kingfisher

class SportsCollectionViewCell: UICollectionViewCell {
    
   // @IBOutlet private weak var sportsNameLabel: UILabel!
   
    @IBOutlet weak var sportsNameLabel: UILabel!
    @IBOutlet weak var sportsImageView: UIImageView!
    
    func configrationCellLabel(with sportName : String){
        sportsNameLabel.text = sportName
    }
    
    func congigrationCellImage(with sportImageURL : String){
        sportsImageView.kf.setImage(with: URL(string: sportImageURL))
    }
}
