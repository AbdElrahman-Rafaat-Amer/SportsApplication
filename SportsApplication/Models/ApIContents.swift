//
//  ApIContents.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/11/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation

enum APIContents

{
    static let BASE_URL_MAIN = "https://www.thesportsdb.com/api/v1/json/1/all_sports.php"
    static let BASE_URL_LEAGUES = "https://www.thesportsdb.com/api/v1/json/1/search_all_leagues.php?s="
    static let SPORTS = "sports"
    static let COUNTRYS = "countrys"
    static let idSport = "idSport"
    static let strSport = "strSport"
    static let strFormat = "strFormat"
    static let strSportThumb = "strSportThumb"
    static let strSportThumbGreen = "strSportThumbGreen"
    static let strSportDescription = "strSportDescription"
    static let sportsArrayNotification = "sportsArrayNotification"
    static let idLeague = "idLeague"
    static let strLeague = "strLeague"
    static let strDivision = "strDivision"
    static let strYoutube = "strYoutube"
    static let strBadge = "strBadge"
    static let leaguesArrayNotification = "leaguesArrayNotification"
    static let savedLeaguesArrayNotification = "savedLeaguesArrayNotification"
    static let EVENTS = "events"
    static let EVENT = "event"
    static let  idEvent = "idEvent"
    static let strEvent = "strEvent"
    static let strDateEvent = "dateEvent"
    static let strTimeEvent = "strTime"
    static let intAwayScore = "intAwayScore"
    static let intHomeScore = "intHomeScore"
    static let eventsArrayNotification = "eventsArrayNotification"
    static let latestArrayNotification = "latestArrayNotification"
    static let TEAMS = "teams"
    static let idTeam = "idTeam"
    static let strTeam = "strTeam"
    static let strTeamBadge = "strTeamBadge"
    static let strTeamLogo = "strTeamLogo"
    static let teamsArrayNotification = "teamsArrayNotification"
    static let strCountry = "strCountry"
    static let intFormedYear = "intFormedYear"
    static let strStadiumThumb = "strStadiumThumb"
    static let strStadium = "strStadium"
    static let strStadiumLocation = "strStadiumLocation"
    static let teamDetailsNotification = "teamDetailsNotification"
    static let baseLink = "https://www.thesportsdb.com/api/v1/json/2"
    static let allSports = "/all_sports.php"
    static let allLeagues = "/search_all_leagues.php"
    static let strThumb = "strThumb"
   
    
}
