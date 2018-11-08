//
//  VocabView.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import UIKit
import PureLayout

class VocabView: UIView{
    
    var loaderView: LoaderView!
    
    var cardBackground: UIView!
    var wordImageView: UIImageView!
    
    var answersView: UIView!
    var answerView: AnswerView!
    
    var answers = [AnswerView]()
    
    var modeToogleView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
        addViews()
        setConstrain()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setViews(){
        self.backgroundColor = Constants.Colors.background
        
        loaderView = LoaderView()
        loaderView.configureForAutoLayout()
        
        cardBackground = UIView()
        cardBackground.backgroundColor = Application.randomColor()
        cardBackground.configureForAutoLayout()
        
        wordImageView = UIImageView()
        wordImageView.contentMode = .scaleAspectFit
        wordImageView.configureForAutoLayout()
        
        answersView = UIView()
        answersView.configureForAutoLayout()
        
        for _ in 0..<4{
            let answerView = AnswerView()
            answerView.configureForAutoLayout()
            answers.append(answerView)
        }
    }
    private func addViews(){
        answers.forEach{
            answersView.addSubview($0)
        }
        [wordImageView, answersView].forEach{
            cardBackground.addSubview($0)
        }
        [loaderView, cardBackground].forEach{
            self.addSubview($0)
        }
    }
    private func setConstrain(){
        loaderView.autoSetDimension(.width, toSize: UIScreen.main.bounds.width-50)
        loaderView.autoConstrainAttribute(.vertical, to: .vertical, of: loaderView.superview!)
        loaderView.autoPinEdge(.top, to: .top, of: loaderView.superview!, withOffset: 50)
        loaderView.autoSetDimension(.height, toSize: 10)
        
        cardBackground.autoPinEdge(.top, to: .bottom, of: loaderView, withOffset: 25)
        cardBackground.autoPinEdge(.left, to: .left, of: cardBackground.superview!, withOffset: 25)
        cardBackground.autoPinEdge(.right, to: .right, of: cardBackground.superview!, withOffset: -25)
        cardBackground.autoPinEdge(.bottom, to: .bottom, of: cardBackground.superview!, withOffset: -50)
        
        wordImageView.autoPinEdge(.left, to: .left, of: wordImageView.superview!, withOffset: 25)
        wordImageView.autoPinEdge(.left, to: .left, of: wordImageView.superview!, withOffset: -25)
        wordImageView.autoPinEdge(.top, to: .top, of: wordImageView.superview!, withOffset: 25)
        wordImageView.autoSetDimension(.height, toSize: UIScreen.main.bounds.height/2.5)
        
        answersView.autoPinEdge(.top, to: .bottom, of: wordImageView, withOffset: 25)
        answersView.autoPinEdge(.left, to: .left, of: answersView.superview!, withOffset: 15)
        answersView.autoPinEdge(.right, to: .right, of: answersView.superview!, withOffset: -15)
        answersView.autoPinEdge(.bottom, to: .bottom, of: answersView.superview!, withOffset: -25)
        
        answers[0].autoPinEdge(.top, to: .top, of: answersView.superview!)
        answers[0].autoPinEdge(.left, to: .left, of: answersView.superview!)
        answers[0].autoPinEdge(.right, to: .right, of: answersView.superview!)
        answers[0].autoSetDimension(.height, toSize: 36)
        
        for i in 1..<answers.count{
            answers[i].autoPinEdge(.top, to: .bottom, of: answers[i-1], withOffset: 3)
            answers[i].autoPinEdge(.left, to: .left, of: answersView.superview!)
            answers[i].autoPinEdge(.right, to: .right, of: answersView.superview!)
            answers[i].autoSetDimension(.height, toSize: 36)
        }
    }
    
    // MARK: - FUNCTIONS
    func setData(image: UIImage, data: [String]){
        wordImageView.image = image
        for i in 0..<answers.count{
            answers[i].anwerLabel.text = data[i]
        }
        cardBackground.backgroundColor = Application.randomColor()
    }
}
