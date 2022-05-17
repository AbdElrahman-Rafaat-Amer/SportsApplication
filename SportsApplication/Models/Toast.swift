//
//  Toast.swift
//  SportsApplication
//
//  Created by AbdElrahman Amer on 5/17/22.
//  Copyright © 2022 Shrouk Mamdouh. All rights reserved.
//

import Foundation
import UIKit

func showToastView(messsage : String, view: UIView ){
    print("showToastView")
    
    let toastLabel = UILabel(frame: CGRect(x: view.frame.size.width/2 - 150, y: view.frame.size.height-100, width: 300,  height : 45))
    toastLabel.backgroundColor = UIColor.black
    toastLabel.textColor = UIColor.white
    toastLabel.textAlignment = NSTextAlignment.center;
    view.addSubview(toastLabel)
    toastLabel.text = messsage
    toastLabel.alpha = 1.0
    toastLabel.layer.cornerRadius = 10;
    toastLabel.clipsToBounds  =  true
    UIView.animate(withDuration: 4.0, delay: 0.1, options: UIView.AnimationOptions.curveEaseOut, animations: {
        toastLabel.alpha = 0.0
        
    })
}
