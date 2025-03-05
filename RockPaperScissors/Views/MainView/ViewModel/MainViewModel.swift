//
//  File.swift
//  RockPaperScissors
//
//  Created by Tung Le on 4/3/2025.
//

import Foundation

class MainViewModel: ObservableObject, GameViewModelProtocol {
  @Published private(set) var playerMove: MoveViewModel?
  @Published private(set) var opponentMove: MoveViewModel? = MoveViewModel(move: Move.allCases.randomElement()!)
  @Published private(set) var expectedResult: GameResult?
  @Published var isShowingScore = false
  @Published var isFinalScoreShowing = false
  @Published private(set) var scoreTitle = ""
  @Published private(set) var score: Int = 0
  @Published private(set) var alertMessage = ""
  @Published private(set) var count = 0
  let maxQuestionCount: Int = 5
  let modelViewModels = Array(Move.allCases.indices).map { MoveViewModel(move: Move.allCases[$0]) }
  var shouldWin: Bool {
    expectedResult == .win
  }  
  
  // MARK: - Methods
  func playMove(_ move: MoveViewModel) {
    playerMove = move
    let result = playerMove?.beat(opponentMove!) ?? false
    if (result && expectedResult == .win) || (!result && expectedResult == .lose && playerMove != opponentMove) {
      score += 1
      scoreTitle = "Correct!"
      alertMessage = "Keep going!"
    } else {
      scoreTitle = "Wrong!"
      alertMessage = "Try again!"
    }
    isShowingScore = true
  }
  
  func nextGame() {
    playerMove = nil
    opponentMove = MoveViewModel(move: Move.allCases.randomElement()!)
    expectedResult = GameResult.allCases.randomElement()!
    count += 1
    
    if count == maxQuestionCount {
      isFinalScoreShowing = true
      scoreTitle = "Game Over!"
      alertMessage = "Your score is \(score)/\(maxQuestionCount)"
    }
  }
  
  func reset() {
    playerMove = nil
    score = 0
    count = 0
  }
}


