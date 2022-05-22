//
//  event.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/11/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation

class Event : Decodable {

    var idEvent : String?
    var strEvent : String?
    var dateEvent : String?
    var strHomeTeam : String?
    var strAwayTeam : String?
    var intHomeScore : String?
    var intAwayScore : String?
    var intRound : String?
    var strTime : String?
    var strTimeLocal : String?
    var strThumb : String?
    var strStatus : String?
}

class AllEvents: Decodable {
    var events: [Event]
}

