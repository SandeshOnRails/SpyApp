//
//  AlphanumericCesarCipher.swift
//  SpyApp
//
//  Created by Sandesh Basnet on 9/12/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct AlphaNumericCesarCipher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String {
        
        if (isAlphaNumeric(plaintext)){
            var encoded = ""
            
            if UInt32(secret) == nil {
                return "Enter a valid shift key"
            }
            
            let shiftBy = UInt32(secret)!
            
            let newText = plaintext.uppercased()
        
        for character in newText {
            
            var unicode = character.unicodeScalars.first!.value
            
            if (String(character) == "Z" && shiftBy > 0){
                unicode = 64
            }
            if (String(character) == "A" && shiftBy < 0){
                unicode = 91
            }
            if unicode == 48 && shiftBy < 0 {
                unicode = 58
            }
            if unicode == 57 && shiftBy > 0 {
                unicode = 47
            }
            
            
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
        }
        else {
            
            print(plaintext)
            
            return "Please enter a valid alpha numeric string"
        }
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        if (isAlphaNumeric(plaintext)){
            var encoded = ""
            
            if UInt32(secret) == nil {
                return "Enter a valid shift key"
            }
            
            let shiftBy = UInt32(secret)!
            
            let newText = plaintext.uppercased()
            
            for character in newText {
                
                var unicode = character.unicodeScalars.first!.value
                
                if (String(character) == "Z" && shiftBy > 0){
                    unicode = 64
                }
                if (String(character) == "A" && shiftBy < 0){
                    unicode = 91
                }
                if unicode == 48 && shiftBy < 0 {
                    unicode = 58
                }
                if unicode == 57 && shiftBy > 0 {
                    unicode = 47
                }
                
                
                let shiftedUnicode = unicode + shiftBy
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
            return encoded
        }
        else {
            
            print(plaintext)
            
            return "Please enter a valid alpha numeric string"
        }
    }
    
    func isAlphaNumeric (_ key: String) -> Bool  {
        
        var hasAlpha = false
        
        var hasNumber = false
        
        let newKey = key.uppercased()
        
        for character in newKey {
            
            
                if (character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90){
                    
                    hasAlpha = true
                }
                
                else {
                    
                    if  UInt32(String(character)) != nil {
                        
                        hasNumber = true
                    }
                }
            }
        
        
        print (hasNumber)
        print (hasAlpha)
        return hasAlpha && hasNumber

    }
    
}

