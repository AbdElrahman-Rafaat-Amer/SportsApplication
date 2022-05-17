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
   /* static func getAllSports(complitionHandler : @escaping (AllSports?) -> Void)*/
}
class NetworkService : MovieService{
    
    /*static func getAllSports(complitionHandler : @escaping (AllSports?) -> Void){
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
    }*/
    
   /* static func getAllLeagues(sportName : String, complitionHandler : @escaping (AllLeagues?) -> Void){
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
    }*/
    
    
  /*  static func getAllTeams(leagueName : String, complitionHandler : @escaping (AllTeams?) -> Void){
        
        let leagueName = setUpParameters(parameters : leagueName)
        print("leagueName----> \(leagueName)//")
        let s = "abdo"
        print("ffdd \(s)//")
        let url = URL(string: NetworkHelper.baseURL.rawValue + EndPoints.allTeamsInLeague.rawValue + leagueName)
        guard let newUrl = url else{
            print("Error in URL")
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                print("Error in Data")
                return
            }
            
            do{
                let result = try JSONDecoder().decode(AllTeams.self, from: data)
                complitionHandler(result)
            }catch let error{
                print("getAllTeams")
                print(error.localizedDescription)
                complitionHandler(nil)
            }
        }
        task.resume()
    }
    */
    
    static func loadDataFromAPi <T : Decodable> (parameterName : String = "", endPoint : String ,complitionHandler : @escaping (T?) -> Void){
        
        let parameterName = setUpParameters(parameters : parameterName)

        let url = URL(string: NetworkHelper.baseURL.rawValue + /*EndPoints.allTeamsInLeague.rawValue*/ endPoint + parameterName)
        guard let newUrl = url else{
            print("Error in URL")
            fatalError("Error in URL")
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                print("Error in Data")
                return
            }
            
            do{
                let result = try JSONDecoder().decode(T.self, from: data)
                complitionHandler(result)
            }catch let error{
                print("Error in decoder")
                print(error.localizedDescription)
                complitionHandler(nil)
            }
        }
        task.resume()
    }
}

