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
    
    
}
