//
//  SubstitutionCipher.swift
//  SpyApp
//
//  Created by Sandesh Basnet on 9/13/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation



struct SubstitutionCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        
        var newText = plaintext
        // dictionary of chars to substitute
        var startAt: UInt32 = 97
        
        // replace all a-z chars with secret chars
        
    
        
        for character in secret {
            
            let toReplaceWith = String (character)
            newText = newText.replacingOccurrences(of: String(UnicodeScalar(UInt8(startAt))), with: toReplaceWith, options: NSString.CompareOptions.literal, range: nil)
            
            startAt = startAt + 1
        }
       

        
        
        return newText
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        var newText = plaintext
        // dictionary of chars to substitute
        var startAt: UInt32 = 97
        
        // replace all a-z chars with secret chars
        
        for character in secret {
            
            let toReplaceWith = String (character)
            newText = newText.replacingOccurrences(of: toReplaceWith, with: String(UnicodeScalar(UInt8(startAt))), options: NSString.CompareOptions.literal, range: nil)
            
            startAt = startAt + 1
        }
        
        
        
        
        return newText
        
}
    
}
