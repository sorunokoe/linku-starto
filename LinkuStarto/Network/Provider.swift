//
//  Provicer.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import Foundation

enum ProviderSourceType{
    case json, api
}
enum ProviderPath{
    case words(level: Constants.Level)
}
class Provider{
    public static func download(_ type: ProviderSourceType, _ path: ProviderPath){
        switch type {
        case .json:
            getStubs(path: path)
        case .api:
            break
        }
    }
    private static func getStubs(path: ProviderPath){
        switch path {
        case .words(let level):
            if let path = Bundle.main.path(forResource: "\(level.rawValue.lowercased())_vocab", ofType: "json") {
                do {
                    let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                    let jsonResult = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                    if let jsonResult = jsonResult as? Dictionary<String, AnyObject>, let words = jsonResult["words"] as? [Any] {
                        print(words)
                        print(words)
                    }
                } catch { }
            }
        }
    }
}
