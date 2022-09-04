import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
        
        setUp()
    }

    func setUp() {
        view.backgroundColor = UIColor.gray
        
        textField.keyboardType = UIKeyboardType.emailAddress
        textField.placeholder = "이메일 입력"
        textField.borderStyle = .roundedRect
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        
        textField.becomeFirstResponder()
    }

    // 화면 터치시, 키보드 내리기
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // 텍스트 필드의 입력을 시작할 때 호출 (시작할지 말지 여부를 허락하는 것)
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }

    // 유저가 입력을 시작하는 그 순간, 함수 호출
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print(#function)
        print("텍스트 입력을 시작함")
    }
    
    // 텍스트를 전체로 없앨지 안 없앨지 선택하는 것 -> clearButtonMode 가 시행과 연관
    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true
    }
    
    // 텍스트 글자 내용이 한 글자 한 글자 입력되거나 지워질 때 호출이 되고 허락 여부를 판단 (중요!)
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength = 10
        let currentString = (textField.text ?? "") as NSString
        let newString = currentString.replacingCharacters(in: range, with: string)
        
        return newString.count <= maxLength
    }
    
    // 텍스트 필드 엔터키가 눌러지면 다음 동작을 허락할 것인지 말 것인지 판다.
    // 네트워크 통신인지...
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // 만약 텍스트필드에 공백이라면 if문 실행!
        if textField.text == "" {
            textField.placeholder = "Type Something!"
            return false
        }else{
            return true
        }
    }
    
    // 텍스트 필드 입력이 끝날 때 호출 (끝날지 말지 허락해주는 것)
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        print(#function)
        return true
    }
    
    // 텍스트 필드의 입력이 실제 끝났을 때 호출 (시점을)
    func textFieldDidEndEditing(_ textField: UITextField) {
        print(#function)
        print("입력을 끝냈다.")
    }
    
    @IBAction func DoneButtonTapped(_ sender: UIButton) {
        // 키보드가 내려가고 싶다.
        textField.resignFirstResponder()
    }
}

