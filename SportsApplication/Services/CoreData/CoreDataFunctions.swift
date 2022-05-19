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
    
{ var viewContext : NSManagedObjectContext!
    init(){

          let appDelegate = UIApplication.shared.delegate as! AppDelegate
          
          viewContext = appDelegate.persistentContainer.viewContext
    
    }
    func addLeague(league : League) {
         let entity = NSEntityDescription.entity(forEntityName: "LeagueEntity", in: viewContext)
         let leagueObject = NSManagedObject(entity: entity!, insertInto: viewContext)
       
    leagueObject.setValue(league.strBadge, forKey: "strBadge")
    leagueObject.setValue(league.strSport, forKey: "strSport")
    leagueObject.setValue(league.strLeague, forKey: "strLeague")
    leagueObject.setValue(league.strYoutube, forKey: "strYoutube")
    leagueObject.setValue(league.idLeague, forKey: "idLeague")
         
         do{
             try viewContext.save()
          
         }catch _{
             print("error in save data")
         }
         
     }
    
    func fetchDataOffline(){
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueEntity")
            do{
                let returnedLeague = try context.fetch(fetchRequest)
                print("favourite")
               
                print(returnedLeague.count)
                
                for i in stride(from: 0, to: returnedLeague.count, by: 1){
           //         self.leagues.append(returnedLeague[i] as! LeagueEntity)
                 //   DispatchQueue.main.async {
               //         self.tableView.reloadData()
                  //  }
                    
                }
                
            }catch {
                print("can not retrive data")
            }
        }
       
       
      
      
     
}
    
   // retrieving the data which inserted from the cordataEntity
    
    
