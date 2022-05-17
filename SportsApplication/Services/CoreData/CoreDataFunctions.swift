//
//  CoreDataFunctions.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/17/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreData
{
    var  manageContext:NSManagedObjectContext?
    
    init() {
        
        let appDelegte = UIApplication.shared.delegate as! AppDelegate
        
        manageContext = appDelegte.persistentContainer.viewContext
    }
    
    // insert the data in the FavouritesLeaguesEntity
    
    func insertfavouriteLeague(league:League)
    {
        let entity = NSEntityDescription.entity(forEntityName: "FavouritesLeaguesEntity", in: manageContext!)
        
        let leagueAttr = NSManagedObject(entity: entity!, insertInto: manageContext)
        
        
        leagueAttr.setValue(league.strSport, forKey: "strSport")
        
        leagueAttr.setValue(league.idLeague, forKey: "idLeague")
        
        leagueAttr.setValue(league.strBadge, forKey: "strBadge")
        
        leagueAttr.setValue(league.strLeague, forKey: "strLeague")
       
      leagueAttr.setValue(league.strYoutube, forKey: "strYoutube")
        
        do{
            try manageContext?.save()
            print("Favouriteleague has been inserted in the database")
            
          }catch let error as NSError{
           print(error)
          }
    }
    
   // retrieving the data which inserted from the cordataEntity
    
    func retrieveFavouriteLeagues() -> [String:[FavouritesLeaguesEntity]]
    {
        var favouriteLeagues:[String:[FavouritesLeaguesEntity]] = [:]
        var leagues:[FavouritesLeaguesEntity] = []
        
        let fetchReq = NSFetchRequest<NSManagedObject>(entityName: "FavouritesLeaguesEntity")
        do{
            leagues = try manageContext?.fetch(fetchReq) as! [FavouritesLeaguesEntity]
            
            for i in leagues
            {
                if(favouriteLeagues[i.strSport!] == nil)
                {
                    favouriteLeagues[i.strSport!] = []
                }
                
                favouriteLeagues[i.strSport!]?.append(i)
            }
            
        }catch let error as NSError{
            print(error)
        }
        return favouriteLeagues
    }
    
    // delete the favouriteLeague from the corData
    
    func deleteFromFavouriteLeagues(league: League){
        DispatchQueue.global(qos: .background).async {[weak self] in
        guard let self = self else {return}
            
        do {
            if let mContext = self.manageContext{
                
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "FavouritesLeaguesEntity")
                
                
            let result = try mContext.fetch(fetchRequest)
                
            mContext.delete((result as! [NSManagedObject]).first!)
                
            try self.manageContext?.save()
                
            print("successful deleting")
               }
           } catch let error {
               print("Deleting the item is failed:", error)
           }
        }
    }
    
    
    
    
}
