//
//  Team.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/11/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
class Team : Decodable{
    
    var ID :Int
    var imageURL : String
   
    init (imageURL : String , ID :Int){
        self.imageURL = imageURL
        self.ID = ID
    }
}
