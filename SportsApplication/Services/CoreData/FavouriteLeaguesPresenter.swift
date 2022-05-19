//
//  FavouriteLeaguesPresenter.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/17/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import CoreData

/*class FavouriteLeaguesPresenter{
    
    var  coredata : CoreData = CoreData()
    
    var result:[String:[FavouritesLeaguesEntity]] = [:]
    
    
    var leagues : [League]!
    
    private var sportName : String!
      
      weak var viewController : ResultAPIProtocl!
      
      func attachView(viewController: ResultAPIProtocl){
          self.viewController = viewController
      }
      
      func setSport(sportName: String){
          self.sportName = sportName
      }
    
    func getLeaguesFromCoreData(){
        
      result =  coredata.retrieveFavouriteLeagues()
     
        
    }
    

      func getFavLeaguesSectionCount() -> Int {
          return result.count
      }
      func getFavLeaguesRowCount(index:Int) -> Int
      {
         
          return Array(result)[index].value.count
      }
    
    func configure(cell:inout FavouriteTableViewCell,forSection:Int,forIndex:Int) {
        let league = Array(result)[forSection].value[forIndex]
        cell.congigrationCellLeagueImage(with: league.strBadge ?? "")
        
        cell.configrationCellLeagueLabel(with: league.strLeague ?? "Not found")
        
        cell.congigrationCellLeagueYoutube(with: league.strYoutube ?? "" )
        }
    
    
}*/
