//
//  File.swift
//  RockPaperScissors
//
//  Created by Tung Le on 4/3/2025.
//

import Foundation

enum Move: String, CaseIterable, Identifiable {
  var id : String {
    UUID().uuidString
  }
  
  case rock = "hammer"
  case paper = "hand.raised.fill"
  case scissors = "scissors"
  
  // MARK: - Methods
  func beats(_ other: Move) -> Bool {
    switch (self, other) {
    case (.rock, .scissors), (.paper, .rock), (.scissors, .paper):
      return true
    default:
      return false
    }
  }
}
