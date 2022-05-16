//
//  AllLeaguesViewPresenter.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/15/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
class AllLeaguesViewPresenter {
    
    var leagues : [League]!
    private var sport : String!
    
    weak var viewController : ResultAPIProtocl!
    
    func attachView(viewController: ResultAPIProtocl){
        self.viewController = viewController
    }
    
    func setSport(sportName: String){
        self.sport = sportName
    }
    
    func getDataFromAPI(){
        NetworkService.getAllLeagues(sportName : sport){[weak self] (result) in
            for i in 0...(result?.countries.count)!-1{
                print(result?.countries[i].strBadge ?? "strBadge")
                print(result?.countries[i].strLeague ?? "strLeague")
                print(result?.countries[i].strYoutube ?? "strYoutube")
                
            }
            self?.leagues = result?.countries
            DispatchQueue.main.async {
                self?.viewController.renderTableView()
                self?.viewController.stopAnimating()
            }
            
        }
    }
}
