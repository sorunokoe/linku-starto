//
//  IconProvider.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import Foundation
import Alamofire
import OAuthSwift

enum IconProviderPath{
    case icon(word: String)
}
class IconProvider{
    
    private let host = "http://api.thenounproject.com"
    private let oauth = OAuthSwiftClient(consumerKey: Constants.NounProject.key, consumerSecret: Constants.NounProject.secret)
    
    public func download(_ path: IconProviderPath){
        oauth.get(url(path), success: { (response) in
            print(response)
            print(response.data)
            print(response.data)
        }) { (error) in
            print(error)
            print(error)
        }
    }
    private func url(_ path: IconProviderPath) -> String{
        switch path {
        case .icon(let word):
            return "\(host)/icons/\(word)?limit_to_public_domain=1&limit=1"
        }
    }
    
}
