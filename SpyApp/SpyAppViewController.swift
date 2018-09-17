import UIKit

class SpyAppViewController: UIViewController {

    @IBOutlet weak var input: UITextField!
    @IBOutlet weak var secret: UITextField!
    @IBOutlet weak var output: UILabel!
    let factory = CipherFactory()
    var cipher: Cipher!

    
    override func viewDidLoad() {
    
    super.viewDidLoad()
    
    cipher = CeaserCipher()
    
    
    }
   
    
    
   
    
    @IBAction func decodeButtonPressed(_ sender: Any) {
        
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.decode(output.text!, secret: secret)
    }
    
    // We will talk about this method during lecture
    @IBAction func cipherButtonPressed(_ sender: UIButton) {
        let key = sender.titleLabel!.text!
        cipher = factory.cipher(for: key)
    }
    
    
    @IBAction func encodeButtonPressed(_ sender: Any) {
        
        let plaintext = input.text!
        let secret = self.secret.text!
        output.text = cipher.encode(plaintext, secret: secret)
        
    }
    
    
    @IBAction func alphanumcesar(_ sender: UIButton) {
        
        let key = sender.titleLabel!.text!
        cipher = factory.cipher(for: key)
        
    }
    
    @IBAction func rot13(_ sender: UIButton) {
        
        let key = sender.titleLabel!.text!
        cipher = factory.cipher(for: key)
        
    }
    
    @IBAction func subcipher(_ sender: UIButton) {
        
        let key = sender.titleLabel!.text!
        print(key)
        cipher = factory.cipher(for: key)
        
        
    }
    
}

