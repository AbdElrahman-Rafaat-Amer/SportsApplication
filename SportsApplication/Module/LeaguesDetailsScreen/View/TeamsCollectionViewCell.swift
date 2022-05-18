//
//  TeamsCollectionViewCell.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/17/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

class TeamsCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var teamImageView: UIImageView!
    
   func configrationTeamCell(with teamImageURL : String){
        teamImageView.kf.setImage(with: URL(string: teamImageURL))
    }
    
    override func layoutSubviews() {
        teamImageView.layer.cornerRadius = teamImageView.bounds.height / 2
        teamImageView.clipsToBounds = true
    }
    
    override func draw(_ rect: CGRect) {
        self.layer.cornerRadius = self.frame.size.width / 2
    }
}


