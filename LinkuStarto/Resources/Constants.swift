//
//  Constants.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import UIKit
import Hue

class Constants{
    
    enum Level: String{
        case N5, N4, N3, N2, N1
    }
    struct Colors{
        static let grayed = UIColor(hex: "#938F8F")
        static let background = UIColor(hex: "#262626")
        
        static let correct = UIColor(hex: "#4A9E7B")
        static let wrong = UIColor(hex: "#C53054")
        
        static let rainbow = [
            UIColor(hex: "#34C588"),
            UIColor(hex: "#34A2C5"),
            UIColor(hex: "#C53434"),
            UIColor(hex: "#C59C34"),
            UIColor(hex: "#C59C34"),
            UIColor(hex: "#34BCC5"),
            UIColor(hex: "#3477C5"),
            UIColor(hex: "#6F64E5"),
            UIColor(hex: "#E5646C"),
            UIColor(hex: "#E56464"),
            UIColor(hex: "#E5AA64"),
            UIColor(hex: "#52BC9C"),
            UIColor(hex: "#BCB852"),
            UIColor(hex: "#BC9252"),
            UIColor(hex: "#52BCB6"),
            UIColor(hex: "#5296BC"),
            UIColor(hex: "#BC5285"),
            UIColor(hex: "#BC5252")
        ]
    }
    struct NounProject{
        static let key = "bfa2e102ea9348c3b0c1a4e3ad627ccb"
        static let secret = "145b8d1ca63c441daadffc8e4eb01f7e"
    }
    
}
