//
//  BaseOFApI.swift
//  SportsApplication
//
//  Created by Shrouk Mamdouh on 5/13/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import Alamofire
class BaseApi<T:RequestType>
{
    func fetchData<M:Decodable>(target:T,responseClass:M.Type,Completion:@escaping(Swift.Result<M?,NSError>)->Void) {
        
        guard let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue) else { return }
        
        let headers = target.headers
        let prams = bulidParams(task: target.task)
        Alamofire.request(target.baseURL+target.path,method:method,parameters:prams.0,encoding:prams.1,headers:headers).responseJSON { (response) in
            guard let statusCode = response.response?.statusCode else
            {
                Completion(.failure(NSError()))
                return
            }
            if statusCode == 200
            {
              
                 guard let jsonResponse = try? response.result.value else {
                     Completion(.failure(NSError()))
                     return
                 }
                
                guard let theJSONData = try? JSONSerialization.data(withJSONObject: jsonResponse, options: []) else {
                    Completion(.failure(NSError()))
                    return
                }
                
                guard let responseObj = try? JSONDecoder().decode(M.self, from: theJSONData) else {
                    Completion(.failure(NSError()))
                    return
                }
                Completion(.success(responseObj))
            }
            else{
                Completion(.failure(NSError()))
            }
        }
        
    }
    
    private func bulidParams(task:Task)->([String:Any],ParameterEncoding)
    {
        switch task {
        case .requestPlain:
            return([:],URLEncoding.default)
        case .requestParameters(let parameters, let encoding):
            return (parameters,encoding)
        }
    }
    
    
}

