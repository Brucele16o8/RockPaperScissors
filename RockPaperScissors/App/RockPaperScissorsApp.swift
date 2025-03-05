//
//  RockPaperScissorsApp.swift
//  RockPaperScissors
//
//  Created by Tung Le on 2/3/2025.
//

import SwiftUI

@main
struct RockPaperScissorsApp: App {
    var body: some Scene {
        WindowGroup {
          MainView(viewModel: MainViewModel())
        }
    }
}
