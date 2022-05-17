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
    case allSports        = "all_sports.php"
    case allLeagues       = "search_all_leagues.php?s="    //pass sport name
    case allTeamsInLeague = "search_all_teams.php?l="      //pass league name
    case allLastEventsInLeague   = "eventsseason.php?id="  //pass league id
    // get 100 result / events for league
    case lastFiveResultForTeam   = "eventslast.php?id="           //pass team id
    // get 5 Events / result for team
}

func setUpParameters(parameters : String) -> String{
    let suffix : Set<Character> = ["\r"]
    var newParameters = parameters
    newParameters.removeAll(where: {suffix.contains($0)})
    newParameters = newParameters.trimmingCharacters(in: .newlines)
    return newParameters.replacingOccurrences(of: " ", with: "%20")
}
