//
//  AllLeaguesTableViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/12/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit


class AllLeaguesTableViewController: UITableViewController {
    
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : AllLeaguesViewPresenter!
    var sportName : String?
    var leagues : [League] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("SportName----> \(sportName ?? "sportName")")
        navigationItem.title = sportName
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        presenter = AllLeaguesViewPresenter()
        presenter.attachView(viewController: self)
        presenter.setSport(sportName: sportName!)
        presenter.getLeaguesFromAPI()
        
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return leagues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell =  UITableViewCell()
        
        if let leagueCell = tableView.dequeueReusableCell(withIdentifier:  "LeagueViewCell", for: indexPath) as? LeagueTableViewCell {
            
            //   leagueCell.layer.cornerRadius = leagueCell.bounds.height / 2
            // leagueCell.clipsToBounds = true
            leagueCell.configrationCellLeagueLabel(with: leagues[indexPath.row].strLeague ?? "strLeague")
            
            leagueCell.congigrationCellLeagueImage(with: leagues[indexPath.row].strBadge ?? "strBadge" )
            
            leagueCell.congigrationCellLeagueYoutube(with: leagues[indexPath.row].strYoutube ?? "strYoutube" )
            
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

extension AllLeaguesTableViewController : ResultAPIProtocl{
    func stopAnimating() {
        self.indicator.stopAnimating()
    }
    
    func renderTableView() {
        
        if(presenter.leagues == nil){
            print("leagues null in All leagues table view controller")
        }else{
            leagues = presenter.leagues.map({ (item) -> League in
                return item
            })
            self.tableView.reloadData()
        }
    }
    
    
}
