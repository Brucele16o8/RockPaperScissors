//
//  MovePresentable.swift
//  RockPaperScissors
//
//  Created by Tung Le on 4/3/2025.
//

protocol MovePresentable {
  var imageName: String { get }
  
  func beat(_ other: MovePresentable) -> Bool
}
