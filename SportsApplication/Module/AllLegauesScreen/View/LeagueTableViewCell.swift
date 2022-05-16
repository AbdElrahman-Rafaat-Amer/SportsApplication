//
//  LeagueTableViewCell.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/15/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

class LeagueTableViewCell: UITableViewCell {
    
    private var sportYoutubeURL : String!
    
    
    @IBOutlet weak var leagueImageView: UIImageView!
        
    @IBOutlet weak var leagueTitleTextView: UILabel!
    
    @IBAction func leagueYoutubeButton(_ sender: Any) {
        print("Youtube button")
        if(sportYoutubeURL.isEmpty){
             print("No link for youtube")
        }else if let youtubeURL = URL(string: sportYoutubeURL),
            UIApplication.shared.canOpenURL(youtubeURL) {
            print("in first if")
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        } else if let youtubeURL = URL(string: "https://" + sportYoutubeURL) {
            print("in second if")
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        }
    }
    
    
    func configrationCellLeagueLabel(with sportName : String){
        leagueTitleTextView.text = sportName
    }
    
    func congigrationCellLeagueImage(with sportImageURL : String){
        leagueImageView.kf.setImage(with: URL(string: sportImageURL))
    }
    
    func congigrationCellLeagueYoutube(with sportYoutubeURL : String){
        self.sportYoutubeURL = sportYoutubeURL
    }
    
}
