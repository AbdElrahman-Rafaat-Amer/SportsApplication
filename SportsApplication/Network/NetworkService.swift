//
//  NetworkService.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/14/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import Alamofire

protocol MovieService{
    static func getAllSports(complitionHandler : @escaping (AllSports?) -> Void)
}
class NetworkService : MovieService{
    
    static func getAllSports(complitionHandler : @escaping (AllSports?) -> Void){
        let url = URL(string:NetworkHelper.baseURL.rawValue +  EndPoints.allSports.rawValue)
        guard let newUrl = url else{
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                return
            }
            do{
                let result = try JSONDecoder().decode(AllSports.self, from: data)
                complitionHandler(result)
            }catch let error{
                print("getAllSports")
                print(error.localizedDescription)
                complitionHandler(nil)
            }
        }
        task.resume()
    }
    
    static func getAllLeagues(sportName : String, complitionHandler : @escaping (AllLeagues?) -> Void){
        let url = URL(string: NetworkHelper.baseURL.rawValue + EndPoints.allLeagues.rawValue + sportName)
           guard let newUrl = url else{
               return
           }
           let request = URLRequest(url: newUrl)
           let session = URLSession(configuration: URLSessionConfiguration.default)
           let task = session.dataTask(with: request) { (data, response, error) in
               guard let data = data else{
                   return
               }
            
               do{
                   let result = try JSONDecoder().decode(AllLeagues.self, from: data)
                   complitionHandler(result)
               }catch let error{
                   print("getAllLeagues")
                   print(error.localizedDescription)
                   complitionHandler(nil)
               }
           }
           task.resume()
       }
    
}

