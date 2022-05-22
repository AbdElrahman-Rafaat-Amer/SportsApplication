//
//  AllSportsCollectionViewController.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/14/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import UIKit


class AllSportsCollectionViewController: UICollectionViewController {
    
    let indicator = UIActivityIndicatorView(style: .large)
    var presenter : AllSportsCollectionViewPresenter!
    var sports : [Sport] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "All Sports"
        refreshTableView()
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
        if(ConnectivityMananger.checkNetwork()){
            let AllLegauesScreen = self.storyboard?.instantiateViewController(identifier: "allLeagues")
                as! AllLeaguesTableViewController
            
            AllLegauesScreen.sportName =  sports[indexPath.row].strSport
            AllLegauesScreen.modalPresentationStyle = .fullScreen
            self.navigationController?.pushViewController(AllLegauesScreen, animated: true)
        }else{
            showAlert(title: "Connection Failed", message: "You are offline\nPlease connect to newtwork\nthenTry again", view : self)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let widthSize = (collectionView.frame.size.width - 48) / 2
        return CGSize(width: widthSize, height:180)
    }
    
}


extension AllSportsCollectionViewController{
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if(ConnectivityMananger.checkNetwork()){
            startAnimating()
            setupPresenter()
        }else{
            showAlert(title: "Connection Failed", message: "You are offline\nPlease connect to newtwork\nthenTry again", view : self)
        }
    }
    
    
    private func refreshTableView(){
        self.collectionView.refreshControl = UIRefreshControl()
        collectionView.refreshControl?.addTarget(self, action: #selector(callPullToRefresh), for: .valueChanged)
    }
    
    @objc private func callPullToRefresh(){
        presenter.getAllSportsFromAPI()
    }
    
    
    private func startAnimating(){
        indicator.center = self.view.center
        self.view.addSubview(indicator)
        indicator.startAnimating()
    }
    
    private func setupPresenter(){
        presenter = AllSportsCollectionViewPresenter()
        presenter.attachView(viewController: self)
        presenter.getAllSportsFromAPI()
    }
}

extension AllSportsCollectionViewController : ResultAPIProtocl{
    
    func stopAnimating() {
        self.indicator.stopAnimating()
    }
    
    func renderTableView() {
        
        if(presenter.sports == nil){
            print("sports null in All leagues collection view controller")
        }else{
            sports = presenter.sports.map({ (item) -> Sport in
                return item
            })
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
        }
    }
    
}

