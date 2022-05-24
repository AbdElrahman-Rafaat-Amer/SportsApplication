//
//  ConnectivityManager.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/12/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import Alamofire


public enum NetworkConnectionStatus: String {
    case online
    case offline
}

public protocol NetworkConnectionStatusListener: class {
    func networkStatusDidChange(status: NetworkConnectionStatus)
}
class ConnectivityMananger: NSObject {
    
    private static let manager = NetworkReachabilityManager(host: "www.apple.com")
    
    private static func isNetworkReachable() -> Bool {
        return manager?.isReachable ?? false
    }
    
    static func checkNetwork() -> Bool{
        var isConnected : Bool = false
        if isNetworkReachable(){
            isConnected = true
            
        }
        return isConnected
    }
}


