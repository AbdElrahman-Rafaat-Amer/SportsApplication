//
//  TeamDetails.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/11/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
class Team: Codable {
    
    var idTeam: String?
    var strTeam : String?
    var strTeamShort : String?
    var intFormedYear : String?
    var strSport : String?
    var strLeague : String?
    var strAlternate : String?
    var strStadium : String?
    var strKeywords : String?
    var strStadiumThumb : String?
    var strStadiumLocation : String?
    var intStadiumCapacity : String?
    var strKitColour1 : String?
    var strKitColour2 : String?
    var strTeamBadge : String?
    var strYoutube: String?
    var strWebsite: String?
    var strFacebook: String?
    var strTwitter: String?
    var strInstagram: String?
    var strGender: String?
    var strCountry: String?
    var strTeamJersey: String?
}
class AllTeams : Codable
{
    var teams :[Team]
}
/*
class Team : Decodable{
    
    var ID :Int
    var imageURL : String
   
    init (imageURL : String , ID :Int){
        self.imageURL = imageURL
        self.ID = ID
    }
}
*/
