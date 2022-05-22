//
//  TeamDetailsViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/12/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit
import Kingfisher

class TeamDetailsViewController: UIViewController {

    
    var myTeam : Team?
    var myTeamName : String?
    
    @IBOutlet weak var stadiumImage: UIImageView!
    
    
    @IBOutlet weak var logoImage: UIImageView!
    
    
    @IBOutlet weak var stadiumName: UILabel!
  
    @IBOutlet weak var stadiumLocation: UILabel!
    
    
    @IBOutlet weak var formedYear: UILabel!
    
    @IBOutlet weak var leagueName: UILabel!
    
    @IBOutlet weak var teamName: UILabel!
    
    
    @IBOutlet weak var countryName: UILabel!
    override func viewDidLoad() {
          super.viewDidLoad()

        stadiumName.text = myTeam?.strStadium
        
        
        stadiumLocation.text = myTeam?.strStadiumLocation
        
        teamName.text = myTeam?.strTeam
          
        formedYear.text = myTeam?.intFormedYear
        
        
        countryName.text = myTeam?.strCountry
          
        leagueName.text = myTeam?.strLeague
        
        stadiumImage.kf.setImage(with: URL(string: myTeam?.strStadiumThumb ?? ""))
        
        logoImage.kf.setImage(with: URL(string: myTeam?.strTeamBadge ?? ""))
          // Do any additional setup after loading the view.
      }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
