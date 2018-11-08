//
//  VocabQuestion.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import UIKit


struct Word{
    
    var image: UIImage?
    var kanji: String?
    var hiragana: String?
    var translation: String?
    
    init(json: [String: Any], image: UIImage) {
        self.image = image
        self.kanji = json["kanji"] as? String
        self.hiragana = json["hiragana"] as? String
        self.translation = json["translation"] as? String
    }
    
}
