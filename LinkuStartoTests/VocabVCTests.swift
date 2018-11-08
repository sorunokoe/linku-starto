//
//  VocabVCTests.swift
//  LinkuStartoTests
//
//  Created by Mac on 08.11.2018.
//  Copyright © 2018 Noa. All rights reserved.
//

import XCTest
@testable import LinkuStarto

class VocabVCTests: XCTestCase {

    var sut: VocabVC!
    
    override func setUp() {
        super.setUp()
        sut = VocabVC()
        _ = sut.view
    }
    
    func test_CustomViewNotNil(){
        XCTAssertNotNil(sut.customView)
    }
    
}
