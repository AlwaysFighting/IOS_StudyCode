import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       
    }

    // MARK: - 코드로만 데이터 전송하기
    @IBAction func codeNextButtonTapped(_ sender: UIButton) {
        let firstVC = FirstViewController()
        
        firstVC.someString = "FirstView Send Data"
        
        firstVC.modalPresentationStyle = .fullScreen
        present(firstVC, animated: true, completion: nil)
    }
    
    // MARK: - Stroyboard 로 데이터 전송하기
    @IBAction func storyboardWithCodeButtonTapped(_ sender: UIButton) {
        guard let scondVC = storyboard?.instantiateViewController(withIdentifier: "SecondVC") as? SecondViewController else{ return }
        
        scondVC.someString  = "SecondView Send Data"
        present(scondVC, animated: true, completion: nil)
    }
    
    // MARK: - SegueWay 방식
    @IBAction func stroyboardWithSegueButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "toThirdVC", sender: self)
    }
    
    // 세그웨이 데이터 전달 방식일 때는 prepare 메서드를 반드시 써줘야 한다.
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // segue : 전달된 세그웨이
        if segue.identifier == "toThirdVC" {
            // ViewController 로 타입 변환해줘야 한다.
            let thirdVC = segue.destination as! ThirdViewController
            
            // 데이터 전달하기
            thirdVC.someString = "Segue Data"
        }
        
        // segue : 전달된 세그웨이
        if segue.identifier == "toFinalVC" {
            // ViewController 로 타입 변환해줘야 한다.
            let finalVC = segue.destination as! FinalViewController
            
            // 데이터 전달하기
            finalVC.someString = "Segue Button Data"
        }
    }
    
    // 조건에 따라 -> 세그웨이를 실행할지 말지 허락 판단하는 메서드
    // 버튼에서 직접적으로 연결했을 때만 실행이 된다.
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
}

