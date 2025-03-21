import Foundation

class BaseballGame {
    // 게임을 시작하는 함수
    private func gameStart() {
        print("||| 숫자 야구게임을 시작하겠습니다! 룰루랄라~ |||")
        play() // 게임 진행 함수 호출
    }



}

let game = BaseballGame() // BaseballGame 클래스의 인스턴스 생성
game.gameStart() // 게임 시작 함수 호출
