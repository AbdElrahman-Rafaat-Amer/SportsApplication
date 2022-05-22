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

class CoreDataService {
    private static var instance : CoreDataService?
    private var viewContext : NSManagedObjectContext!
    
    static func getInstance() -> CoreDataService{
        return instance ?? CoreDataService()
    }
    
    private init(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        viewContext = appDelegate.persistentContainer.viewContext
        
    }
    func addLeagueToFavorites(league : League) {
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
    
    func fetchDataOffline() -> [LeagueEntity]{
        
         var favroiteLeagues : [LeagueEntity] = []
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueEntity")
        do{
            let returnedLeague = try viewContext.fetch(fetchRequest)
                  
            print("favourite count \(returnedLeague.count)")
            
            for i in stride(from: 0, to: returnedLeague.count, by: 1){
                favroiteLeagues.append(returnedLeague[i] as! LeagueEntity)
            }
            
        }catch {
            print("can not retrive data")
        }
                
        return favroiteLeagues
    }
    
    func deleteLeagueFromFavorites(league : League){
        do {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "LeagueEntity")
            fetchRequest.predicate = NSPredicate(format: "idLeague == %@", league.idLeague!.description)
            
            if let result = try?viewContext.fetch(fetchRequest){
                let leagueObject = result[0]
                viewContext.delete(leagueObject as! NSManagedObject)
            }
            
            do{
                try viewContext.save()
                print("delete from afavorite")
                
            }catch _{
                print("error in save data")
            }
            
        }}
    
    
    func isFavoriteLeague(league : League) -> Bool {
        var isFavorite = false
        
        let fetchRequest = NSFetchRequest<NSManagedObject>(entityName: "LeagueEntity")
        fetchRequest.fetchLimit =  1
        fetchRequest.predicate = NSPredicate(format: "idLeague == %@" ,league.idLeague!)
        
        do {
            let count = try viewContext.count(for: fetchRequest)
            if count > 0 {
                isFavorite =  true
            }
        }catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return isFavorite
    }
    
    
}




