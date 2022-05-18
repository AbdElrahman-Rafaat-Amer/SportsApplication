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
    var events : [Event]!
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
        NetworkService.loadDataFromAPi(parameterName : league.strLeague ?? "", endPoint: EndPoints.allTeamsInLeague.rawValue){[weak self] (result: AllTeams?) in
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
        NetworkService.loadDataFromAPi(parameterName : league.idLeague ?? "", endPoint: EndPoints.allLastEventsInLeague.rawValue){[weak self] (result: AllEvents?) in
            print("number of events ---> \(result?.events.count ?? -1)")
            if((result?.events.isEmpty) == nil){
                print("no teams exist")
            }else{
                for i in 0...(result?.events.count)!-1{
                    print(result?.events[i].strEvent ?? "strEvent")
                }
            }
            self?.events = result?.events
            DispatchQueue.main.async {
                self?.teamsViewController.renderTableView()
                self?.teamsViewController.stopAnimating()
            }
        }
        
        
    }
}
