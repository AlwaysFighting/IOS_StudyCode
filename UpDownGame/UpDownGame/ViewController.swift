import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var numberLabel: UILabel!
    
    // 컴퓨터가 1~10까지 랜덤 선택
    var comNumber = Int.random(in: 1...10)
    
    var myNumber: Int = 1
    var myNumberString:String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1) mainLabel 에 "선택하세요" 표시하기
        mainLabel.text = "숫자를 선택하세요"
        
        // 2) numberLabel 은 빈 칸으로 ..
        numberLabel.text = ""
    }

    // 숫자 버튼 눌렀을 때
    @IBAction func buttonTapped(_ sender: UIButton) {
        // 1) 버튼의 숫자를 가져와야 함
        guard let numString = sender.currentTitle else {
            return
        }
    
        // 2) 버튼의 숫자 레이블이 numberLabel 에 반영되도록 한다.
        numberLabel.text = numString
        myNumberString = numString
        
        // 3) 선택한 숫자를 변수에 저장한다.(선택사항)
        guard let num = Int(numString) else { return}
        myNumber = num
    }
    
    // Select 버튼 눌렀을 때
    @IBAction func selectButtonTapped(_ sender: UIButton) {
        // 컴퓨터의 숫자와 내가 선택한 숫자를 비교해서
        // UP, Down, Bingo 라고 mainLabel 에 뜨게 하기
        
        // numberLabel 안에 있는 문자열을 옵셔널을 벗겨서 가져오기
        // 그리고 타입 변환(문자열 -> 정수)
        /*guard let myNumString = numberLabel.text else {return }
        guard let myNumInt = Int(myNumString) else { return }*/
        
        
        if comNumber > myNumber {
            mainLabel.text = myNumberString + " 보다 UP"
        } else if  comNumber < myNumber {
            mainLabel.text = myNumberString + " 보다 Down"
        }else{
            mainLabel.text = "Bingo 🥳"
        }
        
    }
    
    // Reset 버튼 눌렀을 때
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 1) mainLabel 이 다시 선택하세요라고 떠야 한다.
        mainLabel.text = "숫자를 선택하세요"
        
        // 2) numberLabel 이 빈 문자열로..
        numberLabel.text = ""
        
        // 3) 컴퓨터 랜덤 숫자를 다시 선택하도록 해야 한다.
        comNumber = Int.random(in: 1...10)
    }
    
}

