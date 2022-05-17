//
//  AllFavoriteTableViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/16/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

class AllFavoriteTableViewController: UITableViewController {
    
   
   let indicator = UIActivityIndicatorView(style: .large)
   
     var presenter : FavouriteLeaguesPresenter!
   
     var sportName : String?
   
     var leagues : [League] = []
    
    var result:[String:[FavouritesLeaguesEntity]] = [:]
   

   override func viewDidLoad() {
       super.viewDidLoad()
       
           navigationItem.title = sportName
           indicator.center = self.view.center
           self.view.addSubview(indicator)
           indicator.startAnimating()
           
           presenter = FavouriteLeaguesPresenter()
       
           presenter.attachView(viewController: self)
       
           presenter.setSport(sportName: sportName!)
           presenter.getLeaguesFromCoreData()
           
       }
   
   
  
   
   // MARK: - Table view data source
   
    override func numberOfSections(in tableView: UITableView) -> Int {
          return presenter.getFavLeaguesSectionCount()
      }

      override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return presenter.getFavLeaguesRowCount(index: section)
      }
      
      override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          var cell =  UITableViewCell()
          
          if var leagueCell = tableView.dequeueReusableCell(withIdentifier: "favouriteSport", for: indexPath) as? FavouriteTableViewCell {
              
           
             /* leagueCell.configrationCellLeagueLabel(with: leagues[indexPath.row].strLeague ?? "strLeague")
              
              leagueCell.congigrationCellLeagueImage(with: leagues[indexPath.row].strBadge ?? "strBadge" )
              
              leagueCell.congigrationCellLeagueYoutube(with: leagues[indexPath.row].strYoutube ?? "strYoutube" )
             */
            presenter.configure(cell: &leagueCell, forSection: indexPath.section, forIndex: indexPath.row)
            
              cell = leagueCell
              
          }
          
          return cell
      }
      
      override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              print("select leage \(leagues[indexPath.row].idLeague ?? "idLeague")")
              
              let LeaguesDetailsScreen = self.storyboard?.instantiateViewController(identifier: "leagueDetails")
                  as! LeagueInformationViewController
              
              LeaguesDetailsScreen.leagueName = leagues[indexPath.row].strLeague
              LeaguesDetailsScreen.modalPresentationStyle = .fullScreen
              self.present(LeaguesDetailsScreen, animated: true, completion: nil)
          }
          
          
      }

      extension AllFavoriteTableViewController : ResultAPIProtocl{
          func stopAnimating() {
              self.indicator.stopAnimating()
          }
          
          func renderTableView() {
           
              
              if(presenter.leagues == nil){
                  print("favleagues null in All table view controller")
              }else{
                  leagues = presenter.leagues.map({ (item) -> League in
    
                    return item
                  })
                  self.tableView.reloadData()
              }
          }
          
          
    }
