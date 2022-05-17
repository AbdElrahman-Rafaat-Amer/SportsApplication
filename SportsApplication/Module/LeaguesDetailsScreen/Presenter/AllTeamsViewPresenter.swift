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
    private var leagueName : String!
    

    
    weak var teamsViewController : ResultAPIProtocl!
    
    func attachView(teamsViewController: ResultAPIProtocl){
        self.teamsViewController = teamsViewController
    }
    
    func setleagueName(leagueName: String){
        self.leagueName = leagueName
    }
    
    func getTeamsFromAPI(){
        print("in teams")
        /*    NetworkService.getAllTeams(leagueName : leagueName){[weak self] (result) in
         if((result?.teams.isEmpty) == nil){
         print(" teams null")
         }else{
         for i in 0...(result?.teams.count)!-1{
         print(result?.teams[i].strTeam ?? "strTeam")
         print(result?.teams[i].strCountry ?? "strCountry")
         print(result?.teams[i].strSport ?? "strSport")
         
         }
         }
         self?.teams = result?.teams
         DispatchQueue.main.async {
         self?.teamsViewController.renderTableView()
         self?.teamsViewController.stopAnimating()
         }
         }*/
        NetworkService.loadDataFromAPi(parameterName : leagueName, endPoint: EndPoints.allTeamsInLeague.rawValue){[weak self] (result: AllTeams?) in
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
    }
}
