//
//  GameResult.swift
//  RockPaperScissors
//
//  Created by Tung Le on 5/3/2025.
//

import Foundation

enum GameResult: CaseIterable {
  case win
  case lose
  case draw
  
  static func determineResult(playerMove: Move, computerMove: Move) -> GameResult {
    if playerMove == computerMove {
      return .draw
    } else if playerMove.beats(computerMove) {
      return .win
    } else {
      return .lose
    }
  }
}
