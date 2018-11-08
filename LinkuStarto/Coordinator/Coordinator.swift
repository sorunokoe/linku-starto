//
//  Coordinator.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import UIKit

enum CoordinatorSegueDestination{
    case main, level, vocabulary
}
class Coordinator{
    static let shared = Coordinator()
    let navigationController = UINavigationController()
    
    public func set(window: UIWindow) {
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
    }
    public func segue(to: CoordinatorSegueDestination, animate: Bool){
        switch to {
        case .main:
            break
        case .level:
            break
        case .vocabulary:
            break
        }
    }
    public func showMain(){
        navigationController.viewControllers = []
    }
}
