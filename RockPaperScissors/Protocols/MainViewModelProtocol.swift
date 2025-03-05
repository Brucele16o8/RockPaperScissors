//
//  MainViewModelProtocol.swift
//  RockPaperScissors
//
//  Created by Tung Le on 5/3/2025.
//

import Foundation

protocol GameViewModelProtocol: ObservableObject {
  var playerMove: MoveViewModel? { get }
  var opponentMove: MoveViewModel? { get }
  var expectedResult: GameResult? { get }
  
  func playMove(_ move: MoveViewModel)
}
