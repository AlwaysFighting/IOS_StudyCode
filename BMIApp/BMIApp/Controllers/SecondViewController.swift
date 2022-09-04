import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var BMINumberLabel: UILabel!
    @IBOutlet weak var adviceLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    var bmiNumber:Double?
    var adviceString: String?
    var bmiColor:UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        makeUIButton()
    }
    
    func makeUIButton(){
        BMINumberLabel.clipsToBounds = true
        BMINumberLabel.layer.cornerRadius = 8
        BMINumberLabel.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)

        backButton.clipsToBounds = true
        backButton.layer.cornerRadius = 5
        backButton.setTitle("다시 계산하기", for: .application)
        
        guard let bmi = bmiNumber else { return }
        BMINumberLabel.text = String(bmi) // double 숫자니까 문자열로 바꿔줘야 한다.
        
        adviceLabel.text = adviceString
        BMINumberLabel.backgroundColor = bmiColor
    }
    
    @IBAction func backButtonTapped(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
    
    
}
