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
    weak var viewController : HomeProtocol!
    
    func attachView(viewController: HomeProtocol){
        self.viewController = viewController
    }
    
    
    func getDataFromAPI(){
        NetworkService.getAllSports{[weak self] (res) in
            for i in 0...(res?.sports.count)!-1{
                print(res?.sports[i].strSport ?? "strSport")
                print(res?.sports[i].strSportThumb ?? "sportThumb")
                print(res?.sports[i].strSportIconGreen ?? "iconGreen")
                
            }
            self?.sports = res?.sports
            DispatchQueue.main.async {
                self?.viewController.renderTableView()
                self?.viewController.stopAnimating()
            }
            
        }
    }
    
}
