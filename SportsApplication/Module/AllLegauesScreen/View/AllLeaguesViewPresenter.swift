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
    private var sportName : String!
    
    weak var viewController : ResultAPIProtocl!
    
    func attachView(viewController: ResultAPIProtocl){
        self.viewController = viewController
    }
    
    func setSport(sportName: String){
        self.sportName = sportName
    }
    
    func getLeaguesFromAPI(){
              
        NetworkService.loadDataFromAPi(parameterName : sportName, endPoint: EndPoints.allLeagues.rawValue){[weak self] (result: AllLeagues?) in
            print("number of leagues ---> \(result?.countries.count ?? -1)")
            if((result?.countries.isEmpty) == nil){
                print("no leagues exist")
            }else{
                for i in 0...(result?.countries.count)!-1{
                    print(result?.countries[i].strLeague ?? "strLeague")
                }
            }
            self?.leagues = result?.countries
            DispatchQueue.main.async {
                self?.viewController.renderTableView()
                self?.viewController.stopAnimating()
            }
        }
    }
}
