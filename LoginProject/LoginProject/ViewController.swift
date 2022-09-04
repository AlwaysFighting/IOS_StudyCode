import UIKit

final class ViewController: UIViewController {
    
    // MARK: - 이메일 입력하는 텍스트 뷰
    // 클로저 실행문
    private lazy var emailTextFieldView: UIView = {
        // UIView 인스턴스를 view 에 넣어서 리턴하는 것. -> 클로저 실행하자마자 view 를 넣는 것
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0.1122844294, green: 0.1134988293, blue: 0.1065287068, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(emailTextField)
        view.addSubview(emailInfoLabel)

        return view
    }()
    
    
    private lazy var emailInfoLabel: UILabel = {
        let label = UILabel()
        
        label.text = "이메일 주소 또는 전화번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = UIColor.white

        return label
    }()
    
    
    private lazy var emailTextField:UITextField = {
        var tf = UITextField()
        
        tf.backgroundColor = .clear
        tf.frame.size.height = 48
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none // 앞에 글자를 대문자로 할 것인지..
        tf.autocorrectionType = .no // 자동으로 틀린 글자를 잡아주는 것
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return tf
    }()
    
    // MARK: - 비밀번호 입력하는 텍스트 뷰
    private lazy var passwordTextFieldView : UIView = {
        let view = UIView()
        
        view.backgroundColor = #colorLiteral(red: 0.1122844294, green: 0.1134988293, blue: 0.1065287068, alpha: 1)
        view.frame.size.height = 48
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        
        view.addSubview(passwordTextField)
        view.addSubview(passwordInfoLabel)
        view.addSubview(passwordSecureButton)
        
        return view
    }()
    
    
    private var passwordInfoLabel:UILabel = {
        let label = UILabel()
        
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        
        return label
    }()
    
    
    private let passwordTextField : UITextField = {
        let tf = UITextField()
       
        tf.backgroundColor = .darkGray
        tf.frame.size.height = 48
        tf.textColor = .white
        tf.tintColor = .white
        tf.backgroundColor = .clear
        tf.autocapitalizationType = .none
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        
        return tf
    }()
    
    // MARK: - 비밀번호 표시하는 텍스트 뷰
    private let passwordSecureButton:UIButton = {
        let button = UIButton(type: .custom) // 보통 버튼 타입을 custom 이라 설정한다.
        
        button.setTitle("표시", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        
        return button
    }()
    
    
    private let loginButton:UIButton = {
        let button = UIButton(type: .custom)
        
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.clipsToBounds = true
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        return button
    }()
    
    lazy var stackView:UIStackView = {
        let st = UIStackView(arrangedSubviews: [emailTextFieldView, passwordTextFieldView, loginButton])
        
        st.spacing = 18 // 내부 간격
        st.axis = .vertical // 축(세로 혹은 가로 정렬)
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    
    private let passwordResetButtons:UIButton = {
        let button = UIButton()
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    
    // 각 3개의 텍스트 팔드 및 로그인 버튼 높이 설정
    private let textviewHeight: CGFloat = 48
    
    // 텍스트 필드 선택시 레이블이 위로 올라가는 애니메이션을 설정하기 위한 autoLayout 위치 조정 작업
    lazy var emailInfoLabelCenterYConstraint = emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        // 2개 설정해야 ViewController 가 델리게이트 역할을 하는 것이다.
        emailTextField.delegate = self
        passwordTextField.delegate = self
        
        makeUI()
    }

    func makeUI(){
        view.backgroundColor = UIColor.black
        view.addSubview(stackView)
        view.addSubview(passwordResetButtons)
        
        // autoLayout 을 하려면 반드시 자동 제약을 막아줘야 한다.
        emailInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // 제약을 배열의 형태로 활성화시키겠다.
        NSLayoutConstraint.activate([
            emailInfoLabel.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8),
            emailInfoLabel.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8),
            //emailInfoLabel.centerYAnchor.constraint(equalTo: emailTextFieldView.centerYAnchor, constant: 0)
            emailInfoLabelCenterYConstraint,
            passwordInfoLabelCenterYConstraint
        ])
        
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        
        emailTextField.leadingAnchor.constraint(equalTo: emailTextFieldView.leadingAnchor, constant: 8).isActive = true
        emailTextField.trailingAnchor.constraint(equalTo: emailTextFieldView.trailingAnchor, constant: 8).isActive = true
        emailTextField.topAnchor.constraint(equalTo: emailTextFieldView.topAnchor, constant: 15).isActive = true
        emailTextField.bottomAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 2).isActive = true
        
        //-----//
        
        passwordInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordSecureButton.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        passwordResetButtons.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            passwordInfoLabel.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordInfoLabel.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            passwordInfoLabel.centerYAnchor.constraint(equalTo: passwordTextFieldView.centerYAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordTextField.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 2),
            passwordTextField.leadingAnchor.constraint(equalTo: passwordTextFieldView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: 8),
            
            passwordSecureButton.topAnchor.constraint(equalTo: passwordTextFieldView.topAnchor, constant: 15),
            passwordSecureButton.bottomAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: -15),
            passwordSecureButton.trailingAnchor.constraint(equalTo: passwordTextFieldView.trailingAnchor, constant: -8),
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textviewHeight * 3 + 36),
            
            passwordResetButtons.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            passwordResetButtons.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            passwordResetButtons.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            passwordResetButtons.heightAnchor.constraint(equalToConstant: textviewHeight)
        ])
    }
    
    @objc func passwordSecureModeSetting() {
        // toggle() 버튼은 한 번 누르면 참, 다시 누르면 거짓..으로 반복해서 나온다.
        passwordTextField.isSecureTextEntry.toggle()
    }
    
    @objc func loginButtonTapped(){
        print("loginButtonTapped")
    }
    
    // selector 이기에 @objc 를 반드시 붙여야 한다.
    @objc func resetButtonTapped(){
        
        let alert = UIAlertController(title: "비밀번호 바꾸기", message: "비밀번호를 바꾸시겠습니까?", preferredStyle: .alert)
    
        let success = UIAlertAction(title: "확인", style: .default) { action in
            print("확인 버튼 눌림")
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel) { cancel in
            print("취소 버튼 눌림")
        }
        
        alert.addAction(success)
        alert.addAction(cancel)
        
        // 다음 화면으로 넘어가는 메서드(경고창이 나오도록 함) - present
        present(alert, animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}

// 위에 있는 ViewController 확장하기
extension ViewController: UITextFieldDelegate {
    
    // 텍스트 필드가 시작이 되면..
    func textFieldDidBeginEditing(_ textField: UITextField) {
        
        // 유저가 선택한 텍스트필드가 이메일 텍스트 필드라면..
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            emailInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토 레이아웃 업데이트
            emailInfoLabelCenterYConstraint.constant = -13
            
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
            passwordInfoLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토 레이아웃 업데이트
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        
        // 동적으로 애니메이션 효과주기
        UIView.animate(withDuration: 0.2){
            self.stackView.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        // 유저가 선택한 텍스트필드가 이메일 텍스트 필드라면..
        if textField == emailTextField {
            emailTextFieldView.backgroundColor = #colorLiteral(red: 0.1122844294, green: 0.1134988293, blue: 0.1065287068, alpha: 1)
            if emailTextField.text == "" {
                emailInfoLabel.font = UIFont.systemFont(ofSize: 18)
                // 오토 레이아웃 업데이트 -> 변수에 담아 놓은 것
                emailInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        if textField == passwordTextField {
            passwordTextFieldView.backgroundColor = #colorLiteral(red: 0.1122844294, green: 0.1134988293, blue: 0.1065287068, alpha: 1)
            if passwordTextField.text == "" {
                passwordInfoLabel.font = UIFont.systemFont(ofSize: 18)
                // 오토 레이아웃 업데이트
                passwordInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        // 동적으로 애니메이션 효과주기
        UIView.animate(withDuration: 0.3){
            self.stackView.layoutIfNeeded()
        }
    }
    
    // UITextField 자기 자신을 호출하자
    @objc func textFieldEditingChanged(_ textField:UITextField){
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
         }
        guard
            let email = emailTextField.text, !email.isEmpty,
            let password = passwordTextField.text, !password.isEmpty
        else{
            loginButton.backgroundColor = #colorLiteral(red: 0.1122844294, green: 0.1134988293, blue: 0.1065287068, alpha: 1)
            loginButton.isEnabled = false
            return
        }
        loginButton.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        loginButton.isEnabled = true
    }
}

