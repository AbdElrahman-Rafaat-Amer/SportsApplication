//
//  TeamDetails.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/11/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
class TeamDetails: Decodable, NSCopying {
    
    func copy(with zone: NSZone? = nil) -> Any {
        let copy = TeamDetails(teamID: teamID!, teamName: teamName!, countryTeam: countryTeam!, formedYear: formedYear!, leagueName: leagueName!, teamImage: teamImage!, stadiumImage: stadiumImage!, stadiumName: stadiumName!, stadiumLocation: stadiumLocation!)
        return copy
    }
    
    
    var teamID: Int?
    var teamName : String?
    var countryTeam : String?
    var formedYear : String?
    var leagueName : String?
    var teamImage : String?
    var stadiumImage : String?
    var stadiumName : String?
    var stadiumLocation : String?
    
    init(teamID: Int, teamName : String,
     countryTeam : String,formedYear : String, leagueName : String,
     teamImage : String, stadiumImage : String, stadiumName : String,
     stadiumLocation : String) {
        self.teamID = teamID
        self.teamName = teamName
        self.countryTeam = countryTeam
        self.formedYear = formedYear
        self.leagueName = leagueName
        self.teamImage = teamImage
        self.stadiumImage = stadiumImage
        self.stadiumName = stadiumName
        self.stadiumLocation = stadiumLocation
    }
    
}

