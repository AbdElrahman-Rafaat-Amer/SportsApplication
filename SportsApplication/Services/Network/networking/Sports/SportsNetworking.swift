//
//  SportsNetworking.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/13/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import Alamofire

enum ALLSportsNetwork
{
    case getSports
}
extension ALLSportsNetwork:RequestType
{
    var baseURL: String
    {
        return Constants.baseLink
    }
    
    var path: String
    {
        return Constants.allSports
    }
    
    var method: HTTPMethod
    {
        return .get
    }
    
    var task: Task
    {
        return .requestPlain
    }
    var headers: [String : String]?
    {
        return [:]
    }
    
}

enum AllLeaguesNetwork
{
    case getLegues(sportName:String)
}

extension AllLeaguesNetwork:RequestType
{
    var baseURL: String
       {
           return Constants.baseLink
       }
       
       var path: String
       {
           return Constants.allLeagues
       }
       
       var method: HTTPMethod
       {
           return .get
       }
       
       var task: Task
       {
        switch self {
        case .getLegues(let sportName):
            return .requestParameters(parameters: ["s":sportName], encoding: URLEncoding.default)
        }
       
       }
       var headers: [String : String]?
       {
           return [:]
       }
}

