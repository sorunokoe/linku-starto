//
//  MainVCTests.swift
//  LinkuStartoTests
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import XCTest
@testable import LinkuStarto

class MainVCTests: XCTestCase {

    var sut: MainVC!
    
    override func setUp() {
        super.setUp()
        sut = MainVC()
        _ = sut.view
    }
    
    func test_CustomViewNotNil(){
        XCTAssertNotNil(sut.customView)
    }

}
