//
//  AnswerView.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import UIKit
import PureLayout
import RxSwift

enum AnswerState{
    case ask, correct, wrong
}
class AnswerView: UIView{
    
    var anwerLabel: UILabel!
    var stateVariable = Variable(AnswerState.ask)
    var stateObservable: Observable<AnswerState>{
        return stateVariable.asObservable()
    }
    var disposeBag = DisposeBag()
    
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
        self.layer.cornerRadius = 6
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.black.cgColor
        self.backgroundColor = .clear
        anwerLabel = UILabel()
        anwerLabel.font = UIFont.systemFont(ofSize: 18, weight: .light)
        anwerLabel.textColor = .black
        anwerLabel.configureForAutoLayout()
        stateObservable.subscribe(onNext: { (state) in
            switch state{
            case .ask:
                self.anwerLabel.textColor = .black
                self.backgroundColor = .clear
                self.layer.borderColor = UIColor.black.cgColor
            case .correct:
                self.anwerLabel.textColor = Constants.Colors.correct
                self.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.85)
                self.layer.borderColor = UIColor.white.cgColor
            case .wrong:
                self.anwerLabel.textColor = Constants.Colors.wrong
                self.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 0.85)
                self.layer.borderColor = UIColor.white.cgColor
            }
        }).disposed(by: disposeBag)
    }
    private func addViews(){
        self.addSubview(anwerLabel)
    }
    private func setConstrain(){
        anwerLabel.autoConstrainAttribute(.horizontal, to: .horizontal, of: anwerLabel.superview!)
        anwerLabel.autoPinEdge(.left, to: .left, of: anwerLabel.superview!, withOffset: 15)
    }
}
