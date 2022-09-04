import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var calcultorButton: UIButton!  // 버튼 속성 바꾸기
    
    // 구조체랑 의사소통할 수 있도록 변수 생성
    var bmiManager = BMICalculatorManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainLabel.text = "키와 몸무게를 입력해주세요."
        
        makeUITextField()
        makeUIButtonStyle()
    }

    @IBAction func calculateButtonTapped(_ sender: UIButton) {

        bmiManager.calculateBMI(heightTextField.text!, weightTextField.text!)

        //guard let height = heightTextField.text, let  weight = weightTextField.text else { return }
        //bmi = calculateBMI(height, weight)
    }
    
    // 다음 화면에 넘어갈지 말지..
    // 만약 무조건 넘어가겠다면 --> 굳이 이 메서드를 안 써도 된다.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if heightTextField.text == "" || weightTextField.text == "" {
            mainLabel.text = "키와 몸무게를 입력해주세요!"
            mainLabel.textColor = #colorLiteral(red: 1, green: 0.2073964179, blue: 0, alpha: 1)
            return false
        }
        mainLabel.text = "키와 몸무게를 입력해주세요."
        mainLabel.textColor = UIColor.white
        return true
    }
    
    // 데이터 전달
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        // 세그웨이가 어떠한 문자열이라면...
        if segue.identifier == "toSecondVC" {
            let secondVC = segue.destination as! SecondViewController
            
            // 계산된 결과값을 다음 화면으로 전달함
            secondVC.bmiNumber = bmiManager.getBMIResult()
            secondVC.bmiColor = bmiManager.getBackgroundColor()
            secondVC.adviceString = bmiManager.getBMIAdviceString()
        }
        // 다음화면으로 이동할 때 텍스트필드 초기화하기
        heightTextField.text = ""
        weightTextField.text = ""
    }
    
    // MARK: - 버튼 스타일
    func makeUIButtonStyle() {
        // 버튼을 둥글게 하기 위한 필수 코드
        calcultorButton.clipsToBounds = true
        calcultorButton.layer.cornerRadius = 5
        
        calcultorButton.setTitle("BMI 계산하기", for: .normal)
    }
    
    // MARK: - TextField 스타일
    func makeUITextField() {
        heightTextField.delegate = self
        weightTextField.delegate = self    
     
        heightTextField.placeholder = "cm 단위로 입력해주세요."
        weightTextField.placeholder = "km 단위로 입력해주세요."
        
    
        //heightTextField.keyboardType = .numberPad
        //weightTextField.keyboardType = .numberPad
    }
}

extension ViewController : UITextFieldDelegate {

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        // 숫자로 변형이 되거나 빈 문자열이라면 글자를 입력이 되도록 하겠다.
        // 즉, 숫자만 입력이 되는 논리
        if Int(string) != nil || string == "" {
            return true // 글자 입력 허용
        }
        return false  // 글자 입력 비허용
            
    }
    
    // Enter 누르는 것을 허락을 판단하는 메서드
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 두 개의 텍스트필드를 모두 종료(키보드 내리기)
        if heightTextField.text != "" && weightTextField.text != "" {
            weightTextField.resignFirstResponder() // 첫 번째 응답자를 해제시키겠다.
            return true
        } else if heightTextField.text != ""{
            // 두 번째 텍스트필드로 넘어가도록 한다.
            weightTextField.becomeFirstResponder()
            return true
        }
        return false
    }
    
    // 유저의 터치가 일어나면 메서드가 불리는 코드 -> 키보드를 내리겠다는 의미
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        heightTextField.resignFirstResponder()
        weightTextField.resignFirstResponder()
    }
    
}

