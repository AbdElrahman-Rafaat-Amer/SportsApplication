//
//  AllSportsCollectionViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/14/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit

protocol HomeProtocol : AnyObject{
    func stopAnimating()
    func renderTableView()
}

class AllSportsCollectionViewController: UICollectionViewController {
    
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : AllSportsCollectionViewPresenter!
    var sports : [Sport] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Sports"
        
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
        
        presenter = AllSportsCollectionViewPresenter()
        presenter.attachView(viewController: self)
        
        presenter.getDataFromAPI()
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sports.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell =  UICollectionViewCell()
        
        if let sportCell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as? SportsCollectionViewCell {
            
            sportCell.configrationCellLabel(with: sports[indexPath.row].strSport ?? "strSport")
            
            sportCell.congigrationCellImage(with: (sports[indexPath.row].strSportThumb ?? sports[indexPath.row].strSportIconGreen) ?? "sportIconHolder")
            cell = sportCell
        }
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("Selected Sport \(sports[indexPath.row].strSport ?? "strSport")")
        let AllLegauesScreen = self.storyboard?.instantiateViewController(identifier: "allLeagues")
            as! AllLeaguesTableViewController
        
        AllLegauesScreen.sportName =  sports[indexPath.row].strSport  
        AllLegauesScreen.modalPresentationStyle = .fullScreen
        self.present(AllLegauesScreen, animated: true, completion: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSize = (collectionView.frame.size.width - 48) / 2
        return CGSize(width: widthSize, height:180)
    }
        
}

extension AllSportsCollectionViewController : NetworkConnectionStatusListener{
    func networkStatusDidChange(status: NetworkConnectionStatus) {
        print("---------------------------------------------------------")
        switch status{
        case .offline:
            //showAlertWith(message : "Offline")
            print("offline-----------------------------------")
            
        case .online:
            //    showAlertWith(message : "online")
            print("online-------------------------------------")
        }
    }
}

extension AllSportsCollectionViewController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        ConnectivityMananger.shared().addListener(listener: self)
        print("viewWillAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        ConnectivityMananger.shared().removeListener(listener: self)
         print("viewWillDisappear")
    }
}

extension AllSportsCollectionViewController : HomeProtocol{
    
    func stopAnimating() {
        self.indicator.stopAnimating()
    }
    
    func renderTableView() {
        sports = presenter.sports.map({ (item) -> Sport in
            return item
        })
        self.collectionView.reloadData()
    }
    
}

