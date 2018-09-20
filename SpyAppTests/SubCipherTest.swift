//
//  SubCipherTest.swift
//  SpyAppTests
//
//  Created by Sandesh Basnet on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp


class SubCipherTest: XCTestCase {
    
    var cipher: SubstitutionCipher!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cipher = SubstitutionCipher()
    }
    
    
    
    func test_encode () {
        
        let plaintext = "abc"
        
        let result = cipher.encode(plaintext, secret: "rum")
        XCTAssertEqual("rum", result)
    }
    
    
    func test_decode () {
        
        let plaintext = "rum"
        
        let result = cipher.decode(plaintext, secret: "rum")
        XCTAssertEqual("abc", result)
    }
    
}
