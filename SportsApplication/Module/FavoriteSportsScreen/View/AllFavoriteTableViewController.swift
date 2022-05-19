//
//  AllFavoriteTableViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/16/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit
import CoreData

class AllFavoriteTableViewController: UITableViewController {
    
   
   let indicator = UIActivityIndicatorView(style: .large)
   
    // var presenter : FavouriteLeaguesPresenter!
   
     var sportName : String?
   
     var leagues : [LeagueEntity] = []
    
    //var result:[String:[FavouritesLeaguesEntity]] = [:]
   

   override func viewDidLoad() {
       super.viewDidLoad()
       
           navigationItem.title = sportName
           indicator.center = self.view.center
           self.view.addSubview(indicator)
           indicator.startAnimating()
           
         ///  presenter = FavouriteLeaguesPresenter()
       
         //  presenter.attachView(viewController: self)
       
          // presenter.getLeaguesFromCoreData()
           fetchDataOffline()
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
                 self.leagues.append(returnedLeague[i] as! LeagueEntity)
              //   DispatchQueue.main.async {
                     self.tableView.reloadData()
               //  }
                 
             }
             
         }catch {
             print("can not retrive data")
         }
     }
    
    
   
   
  
   
   // MARK: - Table view data source
   
    override func numberOfSections(in tableView: UITableView) -> Int {
         return leagues.count
      }

      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
      }
      
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          var cell =  UITableViewCell()
          
          if var leagueCell = tableView.dequeueReusableCell(withIdentifier: "favouriteSport", for: indexPath) as? FavouriteTableViewCell {
              
           
              leagueCell.configrationCellLeagueLabel(with: leagues[indexPath.row].strLeague ?? "strLeague")
              
              leagueCell.congigrationCellLeagueImage(with: leagues[indexPath.row].strBadge ?? "strBadge" )
              
              leagueCell.congigrationCellLeagueYoutube(with: leagues[indexPath.row].strYoutube ?? "strYoutube" )
            
         //   presenter.configure(cell: &leagueCell, forSection: indexPath.section, forIndex: indexPath.row)
            
              cell = leagueCell
              
          }
          
          return cell
      }
      
      override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              print("select leage \(leagues[indexPath.row].idLeague ?? "idLeague")")
              
              let LeaguesDetailsScreen = self.storyboard?.instantiateViewController(identifier: "leagueDetails")
                  as! LeagueInformationViewController
              
          //    LeaguesDetailsScreen.league = leagues[indexPath.row]
              LeaguesDetailsScreen.modalPresentationStyle = .fullScreen
              self.present(LeaguesDetailsScreen, animated: true, completion: nil)
          }
          
          
      }

      extension AllFavoriteTableViewController : ResultAPIProtocl{
          func stopAnimating() {
              self.indicator.stopAnimating()
          }
          
          func renderTableView() {
           
              
            
              }
                    
          
    }
