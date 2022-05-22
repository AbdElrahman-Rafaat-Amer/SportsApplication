//
//  FavouriteLeaguesPresenter.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/17/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import CoreData

class FavouriteLeaguesPresenter{
    
    private let coreData = CoreDataService.getInstance()
    
    weak var viewController : ResultAPIProtocl!
     var favouriteleagues : [LeagueEntity]!
    
    func attachView(viewController: ResultAPIProtocl){
        self.viewController = viewController
    }
    
    
    func getAllFavoriteSports(){
        
      favouriteleagues =  coreData.fetchDataOffline()
    DispatchQueue.main.async {
          self.viewController.renderTableView()
        self.viewController.stopAnimating()
        
        }
    }
    
}
