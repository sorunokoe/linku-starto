//
//  VocabViewModel.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import UIKit


class VocabViewModel{
    
    var questions = [Word]()
    var level: Constants.Level!
    
    init(level: Constants.Level) {
        self.level = level
        downloadWords()
    }
    
    func downloadWords(){
        Provider.download(.json, .words(level: level))
    }
    
}
