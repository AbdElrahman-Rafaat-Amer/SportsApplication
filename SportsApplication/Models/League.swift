//
//  League.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/11/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation

class League :Decodable
{
    var idLeague: String?
    var strSport: String?
    var strYoutube:String?
    var strBadge:String?
    var strLeague:String
    init() {
        idLeague = ""
        strSport = ""
        strYoutube = ""
        strBadge = ""
        strLeague = ""
    }
}
class LeaguesResponse:Decodable
{
    var league:[League]
}
