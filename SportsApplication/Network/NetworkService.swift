//
//  NetworkService.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/14/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService{

   // This code will call the iTunes top 25 movies endpoint listed above
    static func getData(){
      let apiToContact = "https://www.thesportsdb.com/api/v1/json/2/all_sports.php"
   Alamofire.request(apiToContact).validate().responseJSON() { response in
       switch response.result {
       case .success:
           if let value = response.result.value {
               //let json = JSON(value)
            print(value)
               // Do what you need to with JSON here!
               // The rest is all boiler plate code you'll use for API requests


           }
       case .failure(let error):
           print(error)
       }
        }
        
    }
    
    static func loadJsonData()
    {
    
       Alamofire.request("https://www.thesportsdb.com/api/v1/json/2/all_sports.php").responseJSON { (response) in
            print("Response value \(response)")
          
            print("Response.result.value \(response.result.value!)")
          
        if let json = response.result.value as! [String:Any]?{
            if let responseValue = json["results"] as! [[String:Any]]?{
              print(responseValue)
            }
        }
        }
    }
}
