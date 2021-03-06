//
//  Rot13Test.swift
//  SpyAppTests
//
//  Created by Sandesh Basnet on 9/19/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import XCTest
@testable import SpyApp

class Rot13Test: XCTestCase {
    
    var cipher:ROT13!
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        cipher = ROT13()
    }
    
    
    func test_encode () {
        
        let plaintext = "abc"
        
        let result = cipher.encode(plaintext, secret: "13")
        XCTAssertEqual("NOP", result)
    }
    
    
    func test_decode () {
        
        let plaintext = "nop"
        
        let result = cipher.decode(plaintext, secret: "13")
        XCTAssertEqual("ABC", result)
    }
    
    
    
    
}
