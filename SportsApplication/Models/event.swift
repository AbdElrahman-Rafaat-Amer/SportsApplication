//
//  event.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/11/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation

class Event : Decodable {

    var ID : Int
    var eventName : String
    var eventDate : String
    var eventTime : String
    var thumbURL : String
    var intHomeScore : String
    var intAwayScore : String
    
    init(ID:Int , eventName : String , eventDate : String , eventTime : String,thumb : String ,intHomeScore : String ,  intAwayScore : String ) {
        self.ID = ID
        self.eventName = eventName
        self.eventDate = eventDate
        self.eventTime = eventTime
        self.thumbURL = thumb
        self.intHomeScore = intHomeScore
        self.intAwayScore = intAwayScore
    }
    
}

