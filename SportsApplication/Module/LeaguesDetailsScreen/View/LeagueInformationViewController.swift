//
//  LeagueInformationViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/16/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

class LeagueInformationViewController: UIViewController {
    
    private var isFavorite: Bool = false
    var leagueName : String?
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : AllTeamsViewPresenter!
    var teams : [Team] = []
    
    
    @IBAction func backButton(_ sender: Any) {
        print("back button to leagues screen")
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func addToFavoriteButton(_ sender: UIButton) {
        isFavorite = !isFavorite
        
        if(isFavorite){
            sender.isSelected = isFavorite
            print("add to favroite")
            showToastView(messsage: "add to favroite", view: self.view)
        }else{
            sender.isSelected = isFavorite
            print("remove from favroite")
            showToastView(messsage: "remove from favroite", view: self.view)
        }
        
        
    }
    
    @IBOutlet weak var leagueNameTextView: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        leagueNameTextView.text = "league Details"
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        presenter = AllTeamsViewPresenter()
        presenter.attachView(teamsViewController: self)
        presenter.setleagueName(leagueName: leagueName!)
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
        }
        
    }
}
