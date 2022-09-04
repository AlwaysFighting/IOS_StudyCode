import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    
    // 이전 화면에서 받아올 String 을 받기 위한 변수
    var someString:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        mainLabel.text = someString
    }
    
    @IBAction func backbuttonTapped(_ sender: UIButton) {        
        dismiss(animated: true)
    }
    
}
