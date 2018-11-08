//
//  LoaderView.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import UIKit
import PureLayout
import RxSwift

class LoaderView: UIView{
    
    var placeholderView: UIView!
    var valueView: UIView!
    
    var valueVariable = Variable(100)
    var valueObserver: Observable<Int>{
        return valueVariable.asObservable()
    }
    let disposedBag = DisposeBag()
    
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
        placeholderView = UIView()
        placeholderView.layer.cornerRadius = 6
        placeholderView.backgroundColor = Constants.Colors.grayed
        placeholderView.configureForAutoLayout()
        valueView = UIView()
        valueView.layer.cornerRadius = 6
        valueView.backgroundColor = .white
        valueView.configureForAutoLayout()
        
        valueObserver.subscribe(onNext: { (procent) in
            print(procent)
            DispatchQueue.main.async {
                let result = CGFloat((100-procent)/100)
                UIView.animate(withDuration: 1, animations: {
                    self.valueView.transform = CGAffineTransform(scaleX: result, y: 1.0)
                })
            }
        }).disposed(by: disposedBag)

    }
    private func addViews(){
        [placeholderView, valueView].forEach{
            self.addSubview($0)
        }
    }
    private func setConstrain(){
        placeholderView.autoPinEdge(.left, to: .left, of: placeholderView.superview!)
        placeholderView.autoPinEdge(.right, to: .right, of: placeholderView.superview!)
        placeholderView.autoPinEdge(.top, to: .top, of: placeholderView.superview!)
        placeholderView.autoPinEdge(.bottom, to: .bottom, of: placeholderView.superview!)
        
        valueView.autoPinEdge(.left, to: .left, of: valueView.superview!)
        valueView.autoConstrainAttribute(.width, to: .right, of: placeholderView)
        valueView.autoPinEdge(.top, to: .top, of: valueView.superview!)
        valueView.autoPinEdge(.bottom, to: .bottom, of: valueView.superview!)
    }
}
