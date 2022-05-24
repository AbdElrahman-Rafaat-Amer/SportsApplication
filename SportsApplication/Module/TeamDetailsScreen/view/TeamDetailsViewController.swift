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
    
    @IBOutlet weak var stadiumImage: UIImageView!
    
    @IBOutlet weak var logoImage: UIImageView!
    
    @IBOutlet weak var stadiumName: UILabel!
    
    @IBOutlet weak var stadiumLocation: UILabel!
    
    @IBOutlet weak var formedYear: UILabel!
    
    @IBOutlet weak var leagueName: UILabel!
    
    @IBOutlet weak var teamName: UILabel!
    
    @IBOutlet weak var countryName: UILabel!
    
    @IBOutlet weak var jersyImageView: UIImageView!
    
    @IBAction func websiteButton(_ sender: Any) {
        print("website button")
        if((myTeam?.strWebsite?.isEmpty) == nil){
            print("No link for website")
        }else if let websiteURL = URL(string: myTeam?.strWebsite ?? ""),
            UIApplication.shared.canOpenURL(websiteURL) {
            print("in first if")
            UIApplication.shared.open(websiteURL, options: [:], completionHandler: nil)
        } else if let websiteURL = URL(string: "https://" + (myTeam!.strWebsite ?? "") ) {
            print("in second if")
            UIApplication.shared.open(websiteURL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func youTubeButton(_ sender: Any) {
        print("Youtube button")
        if((myTeam?.strYoutube?.isEmpty) == nil){
            print("No link for youtube")
        }else if let youtubeURL = URL(string: myTeam?.strYoutube ?? ""),
            UIApplication.shared.canOpenURL(youtubeURL) {
            print("in first if")
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        } else if let youtubeURL = URL(string: "https://" + (myTeam!.strYoutube ?? "") ) {
            print("in second if")
            UIApplication.shared.open(youtubeURL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func twitterButton(_ sender: Any) {
        print("Twitter button")
        if((myTeam?.strTwitter?.isEmpty) == nil){
            print("No link for twitter")
        }else if let twitterURL = URL(string: myTeam?.strTwitter ?? ""),
            UIApplication.shared.canOpenURL(twitterURL) {
            print("in first if")
            UIApplication.shared.open(twitterURL, options: [:], completionHandler: nil)
        } else if let twitterURL = URL(string: "https://" + (myTeam!.strTwitter ?? "") ) {
            print("in second if")
            UIApplication.shared.open(twitterURL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func instaButton(_ sender: Any) {
        print("instaButton")
        if((myTeam?.strInstagram?.isEmpty) == nil){
            print("No link for insta")
        }else if let instaURL = URL(string: myTeam?.strInstagram ?? ""),
            UIApplication.shared.canOpenURL(instaURL) {
            print("in first if")
            UIApplication.shared.open(instaURL, options: [:], completionHandler: nil)
        } else if let instaURL = URL(string: "https://" + (myTeam!.strInstagram ?? "") ) {
            print("in second if")
            UIApplication.shared.open(instaURL, options: [:], completionHandler: nil)
        }
    }
    
    
    @IBAction func facebookButton(_ sender: Any) {
        print("facebookButtonn")
        if((myTeam?.strFacebook?.isEmpty) == nil){
            print("No link for facebook")
        }else if let facebookURL = URL(string: myTeam?.strFacebook ?? ""),
            UIApplication.shared.canOpenURL(facebookURL) {
            print("in first if")
            UIApplication.shared.open(facebookURL, options: [:], completionHandler: nil)
        } else if let facebookURL = URL(string: "https://" + (myTeam!.strFacebook ?? "") ) {
            print("in second if")
            UIApplication.shared.open(facebookURL, options: [:], completionHandler: nil)
        }
    }
    
    
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
        
        jersyImageView.kf.setImage(with: URL(string: myTeam?.strTeamJersey ?? ""))
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
