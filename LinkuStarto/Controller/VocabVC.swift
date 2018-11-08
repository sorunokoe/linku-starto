//
//  VocabVC.swift
//  LinkuStarto
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import UIKit
import RxSwift

class VocabVC: UIViewController{
    
    var customView: VocabView!
    var viewModel: VocabViewModel!
    private var timer: Timer!
    private var time = 0
    private let disposeBag = DisposeBag()
    
    override func viewDidLoad(){
        super.viewDidLoad()
        setViews()
    }
    private func setViews(){
        customView = VocabView(frame: view.frame)
        self.view = customView
        viewModel = VocabViewModel(level: .N4)
        
        timer = Timer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
    }
    
    // MAKR: - HANDLER
    @objc private func updateTime(){
        time+=1
        customView.loaderView.valueVariable.value = time
    }
    
}
