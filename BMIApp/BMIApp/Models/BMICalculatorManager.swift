import UIKit

// MARK: - BMI 를 계산하는 인스턴스
// (객체의 역할을 하지만, 객체는 아니다.)
struct BMICalculatorManager {
    
    private var bmi: Double?
    
    // MARK: - BMI 계산 메서드
    // 함수 내부에서 속성을 바꾸니까 mutating 을 넣어야 한다. - struct
    mutating func calculateBMI(_ height : String, _ weight : String) {
        guard let h = Double(height), let w = Double(weight) else {
            bmi = 0.0
            return
        }
        let bmiNumber = w / (h * h) * 10000
        bmi = round(bmiNumber * 10) / 10
    }
    
    // MARK: - BMI 계산 리턴
    func getBMIResult() -> Double {
        return bmi ?? 0.0
    }
    
    // MARK: - background 색상 전달하기
    func getBackgroundColor() -> UIColor {
        guard let bmi = bmi else { return #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) }
        switch bmi {
        case ...18.6 :
            return #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)
        case 18.6...23.0 :
            return #colorLiteral(red: 0.5843137503, green: 0.8235294223, blue: 0.4196078479, alpha: 1)
        case 23.0...25.0 :
            return #colorLiteral(red: 1, green: 0.3927488327, blue: 0.9389568567, alpha: 1)
        case 25.0...30.0 :
            return #colorLiteral(red: 0.9962156415, green: 0.4298253059, blue: 0.4822263122, alpha: 1)
        case 30.0...:
            return #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        default:
            return .black
        }
    }
    
    func getBMIAdviceString() -> String {
        guard let bmi = bmi else { return "" }
        switch bmi {
        case ...18.6 :
            return "저체중"
        case 18.6...23.0 :
            return "표준"
        case 23.0...25.0 :
            return "과체중"
        case 25.0...30.0:
            return "중도비만"
        default:
            return "고도비만"
        }
    }
}

