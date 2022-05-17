//
//  FavouriteTableViewCell.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/17/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {

    private var sportYoutubeURL : String!
    
    @IBAction func youtubeBtn(_ sender: Any) {
        
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
    @IBOutlet weak var favText: UILabel!
    @IBOutlet weak var favImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        favImage.layer.cornerRadius = favImage.bounds.height / 2
        favImage.clipsToBounds = true
    }
    
    func configrationCellLeagueLabel(with sportName : String){
        favText.text = sportName
    }
    
    func congigrationCellLeagueImage(with sportImageURL : String){
        favImage.kf.setImage(with: URL(string: sportImageURL))
       
    }
    
    func congigrationCellLeagueYoutube(with sportYoutubeURL : String){
        self.sportYoutubeURL = sportYoutubeURL
    }
    

}
