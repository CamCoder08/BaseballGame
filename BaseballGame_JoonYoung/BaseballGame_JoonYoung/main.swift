import Foundation

class BaseballGame {
    // 게임을 시작하는 함수
    func gameStart() {
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

    private func play() { // 게임 진행 함수
        let answer = makeAnswer() // 랜덤 숫자 생성 함수 호출하여 정답 저장
        while true { // 정답을 맞출 때까지 무한 반복 실행
            print("숫자를 입력하세요. 입력 범위 1~9 (예시, 253):", terminator: "")
            // 사용자 입력을 받고, 공백을 제거한 후 nil 값 예외 처리
            guard let userInput = readLine()?.trimmingCharacters(in: .whitespaces), !userInput.isEmpty  else {
                print("올바르지 않은 입력값입니다.") // 입력값이 nil이면 오류 메시지 출력
                continue // while 루프의 처음으로 돌아가서 다시 입력받음
            }
            // 입력된 문자열을 정수 배열로 변환 (compactMap을 사용하여 변환 실패한 값은 자동 제거)
            let userNumber = userInput.compactMap { Int(String($0)) }
            // compactMap은 변환이 가능한 경우 변환하고, 불가능한 경우(nil) 제거하는 기능을 가짐
            if userNumber.count != 3 { // 입력값이 3자리 숫자가 아닌 경우 예외 처리
                print("Error: 올바르지 않은 입력값입니다. 세자리 숫자를 입력해주세요!")
                continue
            }

            if Set(userNumber).count != 3 { // 중복된 숫자가 있는 경우 예외 처리
                print("Error: 동일한 숫자를 입력할 수 없습니다. 각각 다른 숫자를 입력하세요! ")
                if userNumber.contains(0) {
                    print("Error: 0을 입력할 수 없습니다. 다시 입력해주세요!")
                }
                continue
            }

            if userNumber.contains(0) { // 입력값에 0이 포함된 경우 예외 처리 (중복과 별도로 체크)
                print("Error: 0을 입력할 수 없습니다. 다시 입력해주세요!")
                continue
            }

            var strike = 0
            var ball = 0
            // 사용자가 입력한 숫자와 정답 숫자를 비교하는 반복문
            for i in 0...2 { // 3개의 숫자를 각각 비교 (i는 0, 1, 2)
                if userNumber[i] == answer[i] {
                    strike += 1
                } else if userNumber.contains(answer[i]) {
                    ball += 1
                }
            }
            // 정답을 맞췄을 경우 게임 종료
            if strike == 3 {
                print("정답입니다. 게임을 종료합니다!")
                break
            } else if strike != 0 || ball != 0 {
                print("[\(strike) 스트라이크]  [\(ball) 볼]")
            } else {
                print("Nothing: 아웃!")
            }
        }
    }
}

let game = BaseballGame() // BaseballGame 클래스의 인스턴스 생성
game.gameStart() // 게임 시작 함수 호출
