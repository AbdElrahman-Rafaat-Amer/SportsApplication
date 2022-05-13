//
//  LeaguesDetailsNetworking.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/13/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import Alamofire


/*protocol EventDataSourceProtocol {
    func getEvents(eid:String,complitionHandler : @escaping ([Event]?,String) -> Void)
    func getLatestResults (id:String,complitionHandler : @escaping ([Event]?,String) -> Void)
    func getTeam(id:String,complitionHandler : @escaping ([TeamDetailsModel]?,String) -> Void)
    
}


class EventDataSource : EventDataSourceProtocol {
    
    let urlMain = "https://www.thesportsdb.com/api/v1/json/2/searchevents.php?e="
    let urlSub = "https://www.thesportsdb.com/api/v1/json/2/eventsseason.php?id="
    let urlTeams = "https://www.thesportsdb.com/api/v1/json/2/search_all_teams.php?l="
    
    
    func getEvents(eid: String,complitionHandler : @escaping ([Event]?,String) -> Void) {
        let url = urlSub + eid
        
        var eventsArray = [Event]()
        
        Alamofire.request(url).response { response in
            
            guard let statusCode = response.response?.statusCode else
            {
            complitionHandler(nil,"Error while fetching eventsArray")
                return
            }
            
            if statusCode == 200{
                
                if let data = response.data {
                let json = JSON(data)
                let events = json[Constants.EVENTS].arrayValue
                for event in events {
                    let id = event[Constants.idEvent].intValue
                    let name = event[Constants.strEvent].stringValue
                    let date = event[Constants.strDateEvent].stringValue
                    let time = event[Constants.strTimeEvent].stringValue
                    let thumb = event[Constants.strThumb].stringValue
                    let intHomeScore = event[Constants.intHomeScore].stringValue
                    let intAwayScore = event[Constants.intAwayScore].stringValue
                    if intAwayScore == ""  {
                    eventsArray.append(Event(ID: id, eventName: name, eventDate: date, eventTime: time, thumb: thumb, intHomeScore: intHomeScore, intAwayScore: intAwayScore))
                        
                       }
                   }
               }
              complitionHandler(eventsArray,"")
               print(eventsArray.count)
           }
        }

    }
    
    
     func getLatestResults(id: String,complitionHandler : @escaping ([Event]?,String) -> Void){
            let url = urlSub + id
            var latestResultsArray = [Event]()
            Alamofire.request(url).response { response in
                
           guard let statusCode = response.response?.statusCode else{
            complitionHandler(nil,"Error while fetching eventsArray")
            return
            }
            if statusCode == 200{
             if let data = response.data {
              let json = JSON(data)
              let events = json[Constants.EVENTS].arrayValue
              for event in events {
                  let id = event[Constants.idEvent].intValue
                  let name = event[Constants.strEvent].stringValue
                  let date = event[Constants.strDateEvent].stringValue
                  let time = event[Constants.strTimeEvent].stringValue
                  let thumb = event[Constants.strThumb].stringValue
                  let intHomeScore = event[Constants.intHomeScore].stringValue
                  let intAwayScore = event[Constants.intAwayScore].stringValue
                  if intAwayScore != ""{
                       latestResultsArray.append(Event(ID: id, eventName: name, eventDate: date, eventTime: time, thumb: thumb, intHomeScore: intHomeScore, intAwayScore: intAwayScore))
                  }
              }
          }
                 complitionHandler(latestResultsArray,"")
                
                  print(latestResultsArray.count)
              }
           }
        }
        
    
    func getTeam(id : String,complitionHandler : @escaping ([TeamDetailsModel]?,String) -> Void) {
            let url = urlTeams + id
            var teamsArray = [TeamDetailsModel]()
            Alamofire.request(url).response { response in
                guard let statusCode = response.response?.statusCode else
                {
                complitionHandler(nil,"Error while fetching eventsArray")
                return
                }
                if statusCode == 200{
                 if let data = response.data {
                    let json = JSON(data)
                    let teams = json[Constants.TEAMS].arrayValue
                    
                    for team in teams {
                        let id = team[Constants.idTeam].intValue
                        
                        let logo = team[Constants.strTeamBadge].stringValue
                        
                        let name = team[Constants.strTeam].stringValue
                        
                        let countryName = team[Constants.strCountry].stringValue
                        
                        let formedYear = team[Constants.intFormedYear].stringValue

                        let stadiumImage = team[Constants.strStadiumThumb].stringValue

                        let stadiumName = team[Constants.strStadium].stringValue

                        let stadiumLocation = team[Constants.strStadiumLocation].stringValue

                        let leagueName = team[Constants.strLeague].stringValue

                      
                        teamsArray.append(TeamDetailsModel(teamID: id, teamName: name, countryTeam: countryName, formedYear: formedYear, leagueName: leagueName, teamImage: logo, stadiumImage: stadiumImage, stadiumName: stadiumName, stadiumLocation: stadiumLocation))
                    }
                  }
                    complitionHandler(teamsArray,"")
                    print(teamsArray.count)
                }
                 
            }
        }
    
    
}*/



