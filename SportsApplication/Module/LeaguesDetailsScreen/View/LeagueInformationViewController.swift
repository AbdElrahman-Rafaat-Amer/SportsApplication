//
//  LeagueInformationViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/16/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit
//import CoreData
class LeagueInformationViewController: UIViewController {
    
    //  let coreData: CoreData = CoreData()
    //  var league : League = League()
    
    private var isFavorite: Bool = false
    var league : League?
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : AllTeamsViewPresenter!
    var teams : [Team] = []
    var events : [Event] = []
    
    //View of Storyboard
    
    @IBOutlet weak var teamsCollectionView: UICollectionView!
    
    @IBOutlet weak var eventsCollectionView: UICollectionView!
    
    @IBOutlet weak var resultCollectionView: UICollectionView!
    
    @IBOutlet weak var leagueNameTextView: UILabel!
    
    @IBAction func backButton(_ sender: Any) {
        print("back button to leagues screen")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToFavoriteButton(_ sender: UIButton) {
        isFavorite = !isFavorite
        
        if(isFavorite){
            sender.isSelected = isFavorite
            //   coreData.insertfavouriteLeague(league :league)
            print("add to favroite")
            showToastView(messsage: "add to favroite", view: self.view)
        }else{
            sender.isSelected = isFavorite
            //  coreData.deleteFromFavouriteLeagues(league: league)
            print("remove from favroite")
            showToastView(messsage: "remove from favroite", view: self.view)
        }
        
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        stratAnimating()
        setupPresenter()
        
        teamsCollectionView.dataSource = self
        teamsCollectionView.delegate = self
        
        eventsCollectionView.dataSource = self
        eventsCollectionView.delegate = self
        
        resultCollectionView.dataSource = self
        resultCollectionView.delegate = self
    }
    
    private func setupPresenter() {
        presenter = AllTeamsViewPresenter()
        presenter.attachView(teamsViewController: self)
        presenter.setleagueName(league: league!)
        presenter.getTeamsFromAPI()
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
        
        if(presenter.events == nil){
            print("events null in view controller")
        }else{
            events = presenter.events.map({ (item) -> Event in
                return item
            })
            print("event count \(events.count)")
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
            return events.count
            
        case resultCollectionView:
            return events.count
            
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
                cell = teamCell
            }
            break
            
        case eventsCollectionView:
            if let eventCell = collectionView.dequeueReusableCell(withReuseIdentifier: "eventCell", for: indexPath) as? EventsCollectionViewCell {
                
                eventCell.configrationUpComingEventsCell(with: events[indexPath.row])
                cell = eventCell
            }
            break
            
        case resultCollectionView:
            if let resultCell = collectionView.dequeueReusableCell(withReuseIdentifier: "resultCell", for: indexPath) as? ResultCollectionViewCell {
                
                resultCell.configrationLastEventsCell(with: events[indexPath.row])
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
            print("event name----> \(events[indexPath.row].strEvent ?? "strEvent")")
            break
            
        case resultCollectionView:
            print("results ")
            break
            
        default:
            print("default")
            break
        }
        
    }
    
    
    
}
