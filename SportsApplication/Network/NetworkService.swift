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
    static func fetchResult(complitionHandler : @escaping (AllSports?) -> Void)
}
class NetworkService : MovieService{
    
    static func fetchResult(complitionHandler : @escaping (AllSports?) -> Void){
        let url = URL(string: "https://www.thesportsdb.com/api/v1/json/2/all_sports.php")
        guard let newUrl = url else{
            return
        }
        let request = URLRequest(url: newUrl)
        let session = URLSession(configuration: URLSessionConfiguration.default)
        //URLSession.shared.dataTask(with: request) { (data, response, error) in
        //    //
        //}
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                return
            }
            do{
                let result = try JSONDecoder().decode(AllSports.self, from: data)
                complitionHandler(result)
            }catch let error{
                print("Here")
                print(error.localizedDescription)
                complitionHandler(nil)
            }
            
            
        }
        task.resume()
        
    }
    
    static func request<T: Decodable>(fromEndpoint: EndPoint, httpMethod: HTTPMethod = .get,parametrs : [String:String] , complitionHandler: @escaping (Swift.Result<T, Error>) -> Void) {
        
        let baseURL = "https://www.thesportsdb.com/api/v1/json/2/"
        
        guard let url = URL(string: "\(baseURL)\(fromEndpoint.rawValue)") else {
            print("Error in URL")
            return
        }
        let request = URLRequest(url: url)
        let session = URLSession(configuration: URLSessionConfiguration.default)
       
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                return
            }
            do{
                let result = try JSONDecoder().decode(T.self, from: data)
                print("res------> \(result)")
                //sports[0].strSport ?? "strSport")")
                complitionHandler(.success(response as! T))
            }catch let error{
                print("Here")
                print(error.localizedDescription)
                complitionHandler(.failure(error))
            }
            
            
        }
        task.resume()
        
    }
}

