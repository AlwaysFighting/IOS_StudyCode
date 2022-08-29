import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var comImageView: UIImageView!
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var comChoiceLabel: UILabel!
    @IBOutlet weak var myChoiceLabel: UILabel!
    
    var myChoice : RPS = RPS.rock // 저장 데이터 공간
    var comChoice : RPS = RPS(rawValue: Int.random(in: 0...2))!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        // 1) 첫 번째/두 번째 이미지 뷰에 준비 이미지를 띄워야 한다.
        comImageView.image = #imageLiteral(resourceName: "ready")
        myImageView.image = UIImage(named: "ready")
        
        // 2) 첫/두 번째 레이블에 "준비"라고 문자열을 띄워야 한다.
        comChoiceLabel.text = "Ready"
        myChoiceLabel.text = "Ready"
    }

    @IBAction func rpButtonTapped(_ sender: UIButton) {
        // 가위, 바위, 보를 선택해서 그 정보를 저장해야함 -> 열거형으로!
        /*guard let title =  sender.currentTitle else {
            
        }*/
        
        // 버튼의 문자를 가져옴
        let title = sender.currentTitle!
        print(title)
        
        switch title {
        case "가위" :
            myChoice = RPS.scissors
        case "바위" :
            myChoice = RPS.rock
        case "보" :
            myChoice = RPS.paper
        default:
            break
        }
    }
    
    @IBAction func slectedButtonTapped(_ sender: UIButton) {
        
        // 1) 컴퓨터가 랜덤으로 선택한 이미지에 표시하고
        // 2) 그 이미지의 레이블에 문자열로 표시해야 한다.
        switch comChoice {
        case RPS.rock :
            comImageView.image = #imageLiteral(resourceName: "rock")
            comChoiceLabel.text = "바위"
        case RPS.scissors :
            comImageView.image = #imageLiteral(resourceName: "scissors")
            comChoiceLabel.text = "가위"
        case RPS.paper :
            comImageView.image = #imageLiteral(resourceName: "paper")
            comChoiceLabel.text = "보"
        }
        
        // 3) 내가 선택한 것을 이미지에 표시하고
        // 4) 레이블에 문자열로 표시해야한다.
        switch myChoice {
        case RPS.rock :
            myImageView.image = #imageLiteral(resourceName: "rock")
            myChoiceLabel.text = "바위"
        case RPS.scissors :
            myImageView.image = #imageLiteral(resourceName: "scissors")
            myChoiceLabel.text = "가위"
        case RPS.paper :
            myImageView.image = #imageLiteral(resourceName: "paper")
            myChoiceLabel.text = "보"
        }
        
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 승부를 판단한 다음, 문자열로 판단한다.
        if comChoice == myChoice {
            mainLabel.text = "비겼습니다."
        } else if comChoice == .rock && myChoice == .paper {
            mainLabel.text = "이겼습니다!"
        } else if comChoice == .paper && myChoice == .scissors{
            mainLabel.text = "이겼습니다!"
        }else if comChoice == .scissors && myChoice == .rock{
            mainLabel.text = "이겼습니다!"
        }else{
            mainLabel.text = "졌습니다..."
        }
        
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        // 0) 처음 준비 상태를 표시
        // 1) 컴퓨터가 랜덤으로 선택한 이미지에 표시하고
        comImageView.image = #imageLiteral(resourceName: "ready")
        comChoiceLabel.text = "Ready.."
        
        // 2) 그 이미지의 레이블에 문자열로 표시해야 한다.
        
        // 3) 내가 선택한 것을 이미지에 표시하고
        
        // 4) 레이블에 문자열로 표시해야한다.
        myImageView.image = #imageLiteral(resourceName: "ready")
        myChoiceLabel.text = "Ready..."
        
        // 5) 컴퓨터가 선택한 것과 내가 선택한 것을 비교해서 승부를 판단한 다음, 문자열로 판단한다.
        
        // 6) 메인 레이블 "선택하세요" 표시
        mainLabel.text = "선택하세요"
        
        // 7) 컴퓨터가 다시 랜덤으로 가위/바위/보를 선택하고 표시
       comChoice = RPS(rawValue: Int.random(in: 0...2))!
    }
    
    
}


