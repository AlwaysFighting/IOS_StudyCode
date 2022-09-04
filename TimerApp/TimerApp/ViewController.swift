import UIKit
import AVFoundation

class ViewController: UIViewController {

    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    weak var timer: Timer?
    
    var number: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        configureUI()
    }

    @IBAction func sliderChanged(_ sender: UISlider) {
        // 슬라이더 value 값을 가지고 텍스트를 셋팅
        let seconds = (Int)(slider.value * 60)
        mainLabel.text = "\(seconds) 초"
        number = seconds
    }
    
    @IBAction func startButtonTapped(_ sender: UIButton) {

        // selector : 메모리 주소를 담아가지고 어떤 주소를 가리킬 것인지 알려주는 것.
        // -> 이 기법은 objective-c 문법이기 때문에 함수 안에 @objc 를 반드시 써줘야 한다.
        // userInfo : 정보 / repeats : 반복 여부
        timer?.invalidate()
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(doSomethingAfterSecond), userInfo: nil, repeats: true)
                
        // 클로저를 사용하면 self 를 써야 한다.
        // 그런데 weak self 가 아니라 self 로 선언하면 self 를 굳이 붙이지 않아도 된다.
        /*timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { [self] _ in
            
            // 반복하고 싶은 코드 - 스타트 버튼을 누르면 1초씩 줄어야 한다.
            if number > 0 {
                number -= 1
                // 슬라이드 줄이기
                slider.value = Float(number) / 60.0
                // 레이블도 다시 표시해줘야함
                mainLabel.text = "\(number) 초"
            }else {
                number = 0
                configureUI()
                // 타이머 죽이기 -> repeat 을 비활성화해주는 것!
                timer?.invalidate()
                // 마지막에 0초가 되면 소리가 나도록 한다.
                AudioServicesPlayAlertSound(SystemSoundID(1321))
            }
        }*/
    }
    
    @objc func doSomethingAfterSecond(){
        if number > 0 {
            number -= 1
            // 슬라이드 줄이기
            slider.value = Float(number) / 60.0
            // 레이블도 다시 표시해줘야함
            mainLabel.text = "\(number) 초"
        }else {
            number = 0
            configureUI()
            // 타이머 죽이기 -> repeat 을 비활성화해주는 것!
            timer?.invalidate()
            // 마지막에 0초가 되면 소리가 나도록 한다.
            AudioServicesPlayAlertSound(SystemSoundID(1322))
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        // 초기화 셋팅
        configureUI()
        
        // 슬라이더를 가운데 정렬
        slider.setValue(0.5, animated: true)
        number = 0
        timer?.invalidate()
    }
    
    // 처음 시작할 때 세팅하는 함수
    func configureUI(){
        mainLabel.text = "Please select a timer"
        slider.value = 0.5
    }
}

