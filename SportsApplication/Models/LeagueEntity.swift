//
//  LeagueEntity.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/18/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import CoreData

class League:Decodable
{
    var idLeague    : String?
    var strSport    : String?
    var strYoutube  :String?
    var strBadge    :String?
    var strLeague   :String?
}

class AllLeagues:Decodable
{
    var countries :[League]
}
