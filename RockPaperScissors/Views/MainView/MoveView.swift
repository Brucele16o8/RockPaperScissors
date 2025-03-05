//
//  MoveView.swift
//  RockPaperScissors
//
//  Created by Tung Le on 4/3/2025.
//

import Foundation
import SwiftUI

struct MoveView: View {
  let movePresentable: MovePresentable
  
  var body: some View {
    Image(systemName: "\(movePresentable.imageName)")
      .font(.largeTitle)
  }
}

#Preview {
  MoveView(movePresentable: MoveViewModel(move: .rock))
}
