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
    
    var presenter : FavouriteLeaguesPresenter!
    
    private let indicator = UIActivityIndicatorView(style: .large)
    var sportName : String?
    var favouriteleagues : [LeagueEntity] = []
    var noFavoriteDateLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Favorite Leagues"
        
        startAnimating()
        setupPresenter()
        refreshTableView()
        noFavoriteDateLabel = showWarning(message : "no Favourite data", view: self.view)
        self.view.addSubview(noFavoriteDateLabel)
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return favouriteleagues.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell =  UITableViewCell()
        
        if let leagueCell = tableView.dequeueReusableCell(withIdentifier: "favouriteSport", for: indexPath) as? FavouriteTableViewCell {
            
            
            leagueCell.configrationCellLeagueLabel(with: favouriteleagues[indexPath.row].strLeague ?? "strLeague")
            
            leagueCell.congigrationCellLeagueImage(with: favouriteleagues[indexPath.row].strBadge ?? "strBadge" )
            
            leagueCell.congigrationCellLeagueYoutube(with: favouriteleagues[indexPath.row].strYoutube ?? "strYoutube" )
            
            print("favouriteleagues.count -------> \(favouriteleagues.count )")
            
            cell = leagueCell
            
        }
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if(ConnectivityMananger.checkNetwork()){
            print("select leage \(favouriteleagues[indexPath.row].idLeague ?? "idLeague")")
            
            print("select leage \(favouriteleagues[indexPath.row].strLeague ?? "strLeague")")
            
            let LeaguesDetailsScreen = self.storyboard?.instantiateViewController(identifier: "leagueDetails")
                as! LeagueInformationViewController
            
            LeaguesDetailsScreen.league = setupLeague(with: favouriteleagues[indexPath.row])
            
            LeaguesDetailsScreen.modalPresentationStyle = .fullScreen
            self.present(LeaguesDetailsScreen, animated: true, completion: nil)
        }else{
            showAlert(title: "Connection Failed", message: "You are offline\nPlease connect to newtwork\nthenTry again", view : self)
        }
    }
    
    
}

extension AllFavoriteTableViewController : ResultAPIProtocl{
    func stopAnimating() {
        self.indicator.stopAnimating()
    }
    
    func renderTableView() {
        
        if(presenter.favouriteleagues == nil){
            print("favouriteleagues null in All  AllFavoriteTableViewController")
        }else{
            favouriteleagues = presenter.favouriteleagues.map({ (item) -> LeagueEntity in
                return item
            })
            if(favouriteleagues.count == 0){
                noFavoriteDateLabel.isHidden = false
            }else{
                noFavoriteDateLabel.isHidden = true
            }
            self.tableView.reloadData()
            self.tableView.refreshControl?.endRefreshing()
        }
    }
}

extension AllFavoriteTableViewController{
    private func startAnimating(){
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    private func refreshTableView(){
        self.tableView.refreshControl = UIRefreshControl()
        tableView.refreshControl?.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
    }
    
    @objc private func callPullToRefresh(){
        presenter.getAllFavoriteSports()
    }
    
    private func setupPresenter(){
        presenter = FavouriteLeaguesPresenter()
        presenter.attachView(viewController: self)
        presenter.getAllFavoriteSports()
    }
    
    private func setupLeague(with favoriteLeague : LeagueEntity) -> League{
        let league = League()
        league.idLeague = favoriteLeague.idLeague
        league.strBadge = favoriteLeague.strBadge
        league.strLeague = favoriteLeague.strLeague
        league.strSport = favoriteLeague.strSport
        league.strYoutube = favoriteLeague.strYoutube
        return league
    }
}
