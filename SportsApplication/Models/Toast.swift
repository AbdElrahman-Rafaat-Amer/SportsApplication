//
//  Toast.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/17/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import UIKit


func showWarning(message : String, view: UIView) -> UILabel{
    let toastLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 340,  height : 90))
    toastLabel.center = CGPoint(x:  view.frame.size.width/2, y:  view.frame.size.height/2)
    toastLabel.textAlignment = NSTextAlignment.center;
    toastLabel.backgroundColor = UIColor.orange
    toastLabel.textColor = UIColor.white
    toastLabel.text  = message
    toastLabel.font = UIFont.systemFont(ofSize: 40)
    
    return toastLabel
}

func showImageViewAsToast(isFavorite : Bool, view: UIView) -> UIImageView{
    var imageName : UIImage = UIImage()
    if(isFavorite){
        imageName = UIImage(systemName: "star.fill")!
    }else{
        imageName = UIImage(systemName: "star")!
    }
    let imageView = UIImageView(image: imageName)
    
    imageView.center = CGPoint(x:  view.frame.size.width/2-100, y:  view.frame.size.height/2-50)
    imageView.frame.size.width  = 200
    imageView.frame.size.height = 200
    imageView.tintColor = .red
    
    imageView.contentMode = UIView.ContentMode.scaleToFill
    UIView.animate(withDuration: 2.0, delay: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: {
        imageView.alpha = 0.0
        
    })
    return imageView
}


 func showAlert(title: String, message: String, view : UIViewController){
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let action = UIAlertAction(title: "OK", style: .cancel, handler: nil)
    alert.addAction(action)
    DispatchQueue.main.async {
        view.present(alert, animated: true, completion: nil)
    }
}

