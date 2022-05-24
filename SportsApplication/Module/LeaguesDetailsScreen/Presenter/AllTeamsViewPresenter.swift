//
//  AllTeamsPresenter.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/16/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
//import CoreData
class AllTeamsViewPresenter {
    
    var teams : [Team]!
    var lastEvents : [Event]!
    var upComingEvents : [Event]!
    private var league : League!
    
    weak var teamsViewController : ResultAPIProtocl!
    
    func attachView(teamsViewController: ResultAPIProtocl){
        self.teamsViewController = teamsViewController
    }
    
    func setleagueName(league: League){
        self.league = league
    }
    
    func getTeamsFromAPI(){
        print("in teams")
        NetworkService.loadDataFromAPi(parameterName : league.strLeague ?? "", endPoint: EndPoints.allTeamsInLeague.rawValue){[weak self] (result: AllTeams?, error) in
            print("number of teams ---> \(result?.teams.count ?? -1)")
            if((result?.teams.isEmpty) == nil){
                print("no teams exist")
            }else{
                for i in 0...(result?.teams.count)!-1{
                    print(result?.teams[i].strTeam ?? "strTeam")
                }
            }
            self?.teams = result?.teams
            DispatchQueue.main.async {
                self?.teamsViewController.renderTableView()
                self?.teamsViewController.stopAnimating()
            }
        }
        
        print("in Events")
        NetworkService.loadDataFromAPi(parameterName : league.idLeague ?? "", endPoint: EndPoints.allLastEventsInLeague.rawValue){[weak self] (result: AllEvents?, error) in
            print("number of events ---> \(result?.events.count ?? -1)")
            if((result?.events.isEmpty) == nil){
                print("no events exist")
            }else{
              /*  for i in 0...(result?.events.count)!-1{
                    print(result?.events[i].strEvent ?? "strEvent")
                }*/
                let formater = DateFormatter()
                formater.dateFormat = "yyyy-MM-dd"
                let dateNow = formater.string(from: Date())
              
                self?.lastEvents = result?.events.filter{$0.dateEvent ?? "" < dateNow}
                
                self?.upComingEvents = result?.events.suffix((result?.events.count)! - (self?.lastEvents.count)!)
                
                print("result count \(result?.events.count ?? -1)")
                print("lastEvents count \(self?.lastEvents.count ?? -2)")
                print("upComingEvents count \(self?.upComingEvents.count ?? -3)")
                
            }
            self?.lastEvents = result?.events
            DispatchQueue.main.async {
                self?.teamsViewController.renderTableView()
                self?.teamsViewController.stopAnimating()
            }
        }
        
        
    }
}
