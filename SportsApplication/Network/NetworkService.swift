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
    
    static func loadDataFromAPi <T : Decodable> (parameterName : String = "", endPoint : String ,complitionHandler : @escaping (T?) -> Void){
        
        print("parameterName \(parameterName)//")
        let newParameterName = setUpParameters(parameters : parameterName)
        print("parameterName \(newParameterName)//")
        
        // url step1
        let url = URL(string: NetworkHelper.baseURL.rawValue +  endPoint + newParameterName)
        print("\(NetworkHelper.baseURL.rawValue)\(endPoint)\(newParameterName)")
        
        guard let newUrl = url else{
            print(url ?? "URL")
            print("Error in URL")
            return
        }
        
        // request step 2
        let request = URLRequest(url: newUrl)
        
        // session step 3
        let session = URLSession(configuration: URLSessionConfiguration.default)
        // task step 4
        let task = session.dataTask(with: request) { (data, response, error) in
            guard let data = data else{
                print("Error in Data")
                return
            }
            
            do{
                
                // result
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

