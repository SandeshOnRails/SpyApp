import Foundation

protocol Cipher {
    func encode(_ plaintext: String, secret: String) -> String
    func decode (_ plaintext: String, secret: String) -> String
}

struct CeaserCipher: Cipher {

    func encode(_ plaintext: String, secret: String) -> String {
        
        if isOnlyAlpha(plaintext) {
        var encoded = ""
            
            if Int32(secret) == nil {
                return "enter a valid secret key"
            }
            
            
            
            var shiftBy = Int32(secret)!
            
            if Int32(secret)! <= -26 {
                
                shiftBy = Int32(secret)! % -26
                
            }
            
            if Int32(secret)! >= 26 {
                
                shiftBy = Int32(secret)! % 26
                
            }
            
            let newText = plaintext.uppercased()

        for character in newText {
            
            var unicode = Int32(character.unicodeScalars.first!.value)
            if (String(character) == "Z" && shiftBy > 0){
                unicode = 64
            }
            if (String(character) == "A" && shiftBy < 0){
                unicode = 91
            }
            let shiftedUnicode = unicode + shiftBy
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            print (shiftedUnicode)
            encoded = encoded + shiftedCharacter
        }
        return encoded
        }
            else {
            return "please enter valid words with alphabets only"
        }
    }
    
    func decode(_ plaintext: String, secret: String) -> String {
        
        var decoded = ""
        let unShiftBy = UInt32(secret)!
        
        for character in plaintext {
            
            let unicode = character.unicodeScalars.first!.value
            
            let char = unicode - unShiftBy
            
            let shiftedCharacter = String(UnicodeScalar(UInt8(char)))
            decoded = decoded + shiftedCharacter
        }
        
        
        return decoded
    }
    
    func isOnlyAlpha (_ key: String) -> Bool {
        
        var hasOnlyAlpha = true
        
        
        
        let newKey = key.uppercased()
        
        for character in newKey {
            
            
            if !(character.unicodeScalars.first!.value >= 65 && character.unicodeScalars.first!.value <= 90) {
                
                hasOnlyAlpha = false
            }
                
            
        }
        
        return hasOnlyAlpha

    }
}
