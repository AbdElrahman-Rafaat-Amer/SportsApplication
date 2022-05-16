//
//  League.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/11/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation

class League:Decodable
{
    var strYoutube:String?
    var strBadge:String?
    var strLeague:String?
}

class AllLeagues:Decodable
{
    var countries :[League]
}
