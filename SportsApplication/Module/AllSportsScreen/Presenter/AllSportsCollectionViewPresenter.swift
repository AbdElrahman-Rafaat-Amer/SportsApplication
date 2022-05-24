//
//  AllSportsCollectionViewPresenter.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/15/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation

class AllSportsCollectionViewPresenter {
    
    var sports : [Sport]!
    weak var viewController : ResultAPIProtocl!
    
    func attachView(viewController: ResultAPIProtocl){
        self.viewController = viewController
    }
    
    
  /*  func getAllSportsFromAPI(){
        
        NetworkService.loadDataFromAPi(endPoint: EndPoints.allSports.rawValue){ [weak self] (result : AllSports?) in
            self?.getItems()
            print("number of sports ---> \(result?.sports.count ?? -1)")
            if((result?.sports.isEmpty) == nil){
                print("no leagues exist")
            }else{
                for i in 0...(result?.sports.count)!-1{
                    print(result?.sports[i].strSport ?? "strSport")
                }
            }
            self?.sports = result?.sports
            DispatchQueue.main.async {
                self?.viewController.renderTableView()
                self?.viewController.stopAnimating()
            }
        }
    }*/
    
    func getAllSportsFromAPI(){
        print("in getItems")
        NetworkService.loadDataFromAPi(endPoint: EndPoints.allSports.rawValue){
        [weak self] (result : AllSports? , error)   in
            print("number of sports ---> \(result?.sports.count ?? -1)")
            if((result?.sports.isEmpty) == nil){
                print("no sports exist")
            }else{
                for i in 0...(result?.sports.count)!-1{
                    print(result?.sports[i].strSport ?? "strSport")
                }
            }
            self?.sports = result?.sports
            DispatchQueue.main.async {
                self?.viewController.renderTableView()
                self?.viewController.stopAnimating()
            }
            
        }
    }
    
    
}
