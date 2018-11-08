//
//  Application.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import UIKit

class Application{
    
    // MARK: - FUNCITONS
    static func showError(vc: UIViewController, error: String){
        let alert = UIAlertController(title: "Some problems", message: error, preferredStyle: .alert)
        alert.present(vc, animated: true, completion: nil)
    }
    static func randomColor() -> UIColor{
        let randomInt = Int.random(in: 0..<Constants.Colors.rainbow.count)
        return Constants.Colors.rainbow[randomInt]
    }
    
}
