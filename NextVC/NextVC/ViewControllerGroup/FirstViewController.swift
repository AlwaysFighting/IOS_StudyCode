import UIKit

class FirstViewController: UIViewController {

    let mainLabel = UILabel()
    let backButton = UIButton(type: .system)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupUI()
        configureUI()
        
        view.backgroundColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
    }
    
    var someString:String? // 옵셔널로 꼭!! 설정해줘야 한다.
    
    // MARK: - 초기 세팅
    func setupUI(){
        // 메인 레이블
        mainLabel.text = someString
        mainLabel.font = UIFont.systemFont(ofSize: 22)
        
        // back button
        backButton.setTitle("back", for: .normal)
        backButton.setTitleColor(.white, for: .normal)
        backButton.backgroundColor = UIColor.blue
        backButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        
        view.addSubview(mainLabel)
        view.addSubview(backButton)
    }
    
    
    // MARK: - 오토레이아웃
    func configureUI(){
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        backButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0),
            mainLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0),
            
            backButton.widthAnchor.constraint(equalToConstant: 70),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40),
            backButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc func backButtonTapped(){
        dismiss(animated: true)
    }
    
}
