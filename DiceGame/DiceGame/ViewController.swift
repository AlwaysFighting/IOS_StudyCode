import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImageView: UIImageView!
    @IBOutlet weak var secondImageView: UIImageView!
    
    var diceArray : [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 초기 주사위 눈 값
        firstImageView.image = diceArray[0]
        secondImageView.image = diceArray[0]
    }
    
    // 버튼을 누르면 주사위를 랜덤으로 던지겠다.
    @IBAction func rollButtonTapped(_ sender: UIButton) {
        // 첫 번째 이미지뷰의 이미지를 랜덤으로 변경
        // 왼,오른쪽 타입이 서로 같아야 한다.
        firstImageView.image = diceArray.randomElement()
        
        // 두 번째 이미지뷰의 이미지를 랜덤으로 변경
        secondImageView.image = diceArray.randomElement()
    }
}

