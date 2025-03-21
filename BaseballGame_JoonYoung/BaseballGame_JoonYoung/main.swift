import Foundation

class BaseballGame {
    // 게임을 시작하는 함수
    private func gameStart() {
        print("||| 숫자 야구게임을 시작하겠습니다! 룰루랄라~ |||")
        play() // 게임 진행 함수 호출
    }
    // 랜덤한 3개의 숫자를 생성하는 함수 (중복 없이 숫자 배열 반환)
    private func makeAnswer() -> [Int] {
        var numbers: [Int] = []
        while numbers.count < 3 { // 배열에 숫자가 3개가 될 때까지 반복
            let randomNumber = Int.random(in: 1...9)
            if !numbers.contains(randomNumber) { // 중복 확인
                numbers.append(randomNumber) // 중복이 없으면 배열에 추가
            }
        }
        return numbers  // 3개의 랜덤 숫자가 포함된 배열 반환
    }



}

let game = BaseballGame() // BaseballGame 클래스의 인스턴스 생성
game.gameStart() // 게임 시작 함수 호출
