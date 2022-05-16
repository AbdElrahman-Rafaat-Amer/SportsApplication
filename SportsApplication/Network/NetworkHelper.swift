//
//  NetworkHelper.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/14/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
enum NetworkHelper : String{
    case baseURL = "https://www.thesportsdb.com/api/v1/json/2/"
}

enum EndPoints : String {
    case allSports      = "all_sports.php"
    case allLeagues     = "search_all_leagues.php?s="
    case allTeams       = "search_all_teams.php"
    case upcomingEvents = "eventslast.php"
    case lastEvents     = "eventslast2.php"
    case events         = "searchevents.php?e="
}
