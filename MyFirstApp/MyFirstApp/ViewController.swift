import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var mybutton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        mybutton.backgroundColor = UIColor.yellow
        mybutton.setTitleColor(.darkText, for: .normal)
        
    }
    
}

