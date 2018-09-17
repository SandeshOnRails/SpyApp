import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "cesar": CeaserCipher(),
        "alphanumcesar" : AlphaNumericCesarCipher(),
        "ROT13" : ROT13(),
        "subcipher" : SubstitutionCipher()
    ]

    func cipher(for key: String) -> Cipher {
        
        return ciphers[key]!
    }
}
