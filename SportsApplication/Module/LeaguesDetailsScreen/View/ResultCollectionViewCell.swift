//
//  ResultCollectionViewCell.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/17/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

class ResultCollectionViewCell: UICollectionViewCell {
    
    /*
    @IBOutlet weak var homeTeamScore: UILabel!
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var eventTime: UILabel!
    
    @IBOutlet weak var awayTeamScore: UILabel!
    
    @IBOutlet weak var eventStatus: UILabel!
    */
    
    @IBOutlet weak var eventImageView: UIImageView!
    
    @IBOutlet weak var eventDate: UILabel!
    
    @IBOutlet weak var homeTeamScore: UILabel!
    
    @IBOutlet weak var awayTeamScore: UILabel!
    
    @IBOutlet weak var eventName: UILabel!
    
    func configrationLastEventsCell(with event : Event){
        eventImageView.kf.setImage(with: URL(string: event.strThumb ?? ""), placeholder: UIImage(named: "lastEvent"))
        eventName.text = event.strEvent
        eventDate.text = event.dateEvent
        homeTeamScore.text = event.intHomeScore
        awayTeamScore.text = event.intAwayScore
        
    }
    
}
