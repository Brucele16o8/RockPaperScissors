//
//  MoveViewModel.swift
//  RockPaperScissors
//
//  Created by Tung Le on 4/3/2025.
//

import Foundation

class MoveViewModel: Identifiable {
  private let move: Move
  var id: String {
    move.id
  }
  
  init(move: Move) {
    self.move = move
  }
}

extension MoveViewModel: MovePresentable {
  var imageName: String {
    self.move.rawValue
  }
  
  func beat(_ other: any MovePresentable) -> Bool {
    self.move.beats(Move(rawValue: other.imageName)!)
  }
}

extension MoveViewModel: Equatable {
  static func == (lhs: MoveViewModel, rhs: MoveViewModel) -> Bool {
    lhs.move == rhs.move
  }
}
