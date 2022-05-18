//
//  EventsCollectionViewCell.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/17/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

class EventsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var upComingEventImageView: UIImageView!
    
    @IBOutlet weak var dateOfUpComingEvent: UILabel!
    
    @IBOutlet weak var nameOfUpComingEvent: UILabel!
    
    
    func configrationUpComingEventsCell(with event : Event){
        upComingEventImageView.kf.setImage(with: URL(string: event.strThumb ?? "eventIconHolder"))
        
        nameOfUpComingEvent.text = event.strEvent
        dateOfUpComingEvent.text = event.eventDate
    }
    
}
