import Foundation

var computerChoice = Int.random(in: 1...100)
var myChoice: Int = 0

while(true) {
    print("숫자를 입력해주세요!")
    let userInput = readLine()
    
    if let input = userInput {
        if let number = Int(input) {
            myChoice = number
        }
    }
    
    //print(myChoice)
    
    if computerChoice > myChoice {
        print(userInput! + "보다 Up")
    }else if computerChoice < myChoice {
        print(userInput! + "보다 Down")
    }else{
        print("Bingo!")
        break
    }
    print("")
}
