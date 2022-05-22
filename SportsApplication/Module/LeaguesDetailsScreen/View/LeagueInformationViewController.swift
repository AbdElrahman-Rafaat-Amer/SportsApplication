//
//  LeagueInformationViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/16/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit
import CoreData

class LeagueInformationViewController: UIViewController {
    
    let coreData = CoreDataService.getInstance()
    
    private var isFavorite: Bool = false
    var league : League?
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : AllTeamsViewPresenter!
    var teams : [Team] = []
    var upComingEvents : [Event] = []
    var lastEvents : [Event] = []
    //View of Storyboard
    
    @IBOutlet weak var noUpComingEvents: UILabel!
    
    @IBOutlet weak var noTeamsFounded: UILabel!
    
    
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    @IBOutlet weak var addToFavoriteButton: UIButton!
    
    @IBAction func backButton(_ sender: Any) {
        print("back button to leagues screen")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToFavoriteButton(_ sender: Any) {
        isFavorite = !isFavorite
        
        if(isFavorite){
            coreData.addLeagueToFavorites(league :league!)
          //  showToastView(messsage: "add to favroite", view: self.view)
            
            self.view.addSubview( showImageViewAsToast(isFavorite : isFavorite, view: self.view))
        }else{
            coreData.deleteLeagueFromFavorites(league: league!)
          //  showToastView(messsage: "remove from favroite", view: self.view)
           self.view.addSubview( showImageViewAsToast(isFavorite : isFavorite, view: self.view))
        }
        addToFavoriteButton.isSelected = isFavorite
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stratAnimating()
        setupPresenter()
        setupProtocls()
        isFavoruiteLeague()
    }
    
}

extension LeagueInformationViewController : ResultAPIProtocl{
    func stopAnimating() {
        self.indicator.stopAnimating()
    }
    
    func renderTableView() {
        if(presenter.teams == nil){
            print("teams null in view controller")
        }else{
            teams = presenter.teams.map({ (item) -> Team in
                return item
            })
            
            print("tems count \(teams.count)")
            self.teamsCollectionView.reloadData()
        }
        
        if(presenter.lastEvents == nil){
            print("events null in view controller")
        }else{
            lastEvents = presenter.lastEvents.map({ (item) -> Event in
                return item
            })
            
            upComingEvents = presenter.upComingEvents.map({ (item) -> Event in
                return item
            })
            print("lastEvents count \(lastEvents.count)")
            self.eventsCollectionView.reloadData()
            self.resultCollectionView.reloadData()
        }
        
    }
    
    func stratAnimating() {
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
}

extension LeagueInformationViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case teamsCollectionView:
            return teams.count
            
        case eventsCollectionView:
            return upComingEvents.count
            
        case resultCollectionView:
            return lastEvents.count
            
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell =  UICollectionViewCell()
        
        switch collectionView {
        case teamsCollectionView:
            if let teamCell = collectionView.dequeueReusableCell(withReuseIdentifier: "teamsCell", for: indexPath) as? TeamsCollectionViewCell {
                
                teamCell.configrationTeamCell(with: teams[indexPath.row].strTeamBadge ?? "teamImage")
                
                if(teams.count > 0){
                    noTeamsFounded.isHidden = true
                }
                
                cell = teamCell
            }
            break
            
        case eventsCollectionView:
            if let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as? EventsCollectionViewCell {
                
                eventCell.configrationUpComingEventsCell(with: upComingEvents[indexPath.row])
                
                if(upComingEvents.count > 0){
                    noUpComingEvents.isHidden = true
                }
                
                cell = eventCell
            }
            break
            
        case resultCollectionView:
            if let resultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as? ResultCollectionViewCell {
                
                resultCell.configrationLastEventsCell(with: lastEvents[indexPath.row])
                cell = resultCell
            }
            break
        default:
            print("in default")
            break
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        switch collectionView {
        case teamsCollectionView:
            print("team name----> \(teams[indexPath.row].strTeam ?? "teamName")")
            break
            
        case eventsCollectionView:
            print("upComingEvents name----> \(upComingEvents[indexPath.row].strEvent ?? "strEvent")")
            break
            
        case resultCollectionView:
            print("lastEvents name----> \(lastEvents[indexPath.row].strEvent ?? "strEvent")")
            print("results ")
            break
            
        default:
            print("default")
            break
        }
        
    }
}

extension LeagueInformationViewController{
    private func setupPresenter() {
        presenter = AllTeamsViewPresenter()
        presenter.attachView(teamsViewController: self)
        presenter.setleagueName(league: league!)
        presenter.getTeamsFromAPI()
        
    }
    
    private func isFavoruiteLeague(){
        isFavorite = coreData.isFavoriteLeague(league: league!)
        print("isFavorite------> \(isFavorite)")
        if(isFavorite){
            addToFavoriteButton.isSelected = true
        }
        
    }
    
    private func setupProtocls(){
        teamsCollectionView.dataSource = self
        teamsCollectionView.delegate = self
        
        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        
        resultCollectionView.dataSource = self
        resultCollectionView.delegate = self
    }
}
