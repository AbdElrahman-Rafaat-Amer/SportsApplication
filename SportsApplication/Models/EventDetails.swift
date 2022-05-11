//
//  LeagueDetails.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/11/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation

class newestEventsResponse: Decodable {
    var newestEvents:[Event]
}

class TeamsApIResponse: Decodable {
    var teams:[Team]
}

class EventApIResponse: Decodable {
    var events:[Event]
}


