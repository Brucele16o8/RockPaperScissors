//
//  ContentView.swift
//  RockPaperScissors
//
//  Created by Tung Le on 2/3/2025.
//

import SwiftUI

struct MainView: View {
  // MARK: - Propertie
  @ObservedObject var viewModel: MainViewModel
  
  // MARK: - View
  var body: some View {
    ZStack {
      /// --- Background
      RadialGradient(stops: [
        Gradient.Stop(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
        Gradient.Stop(color: Color(red: 0.76, green: 0.15, blue: 0.2), location: 0.3)
      ], center: .top, startRadius: 200, endRadius: 700)
      .ignoresSafeArea()
      
      /// --- Main View
      VStack {
        Text("Rock, Paper, Scissors")
          .font(.system(size: 36, weight: .bold, design: .default))
          .foregroundColor(.white)
          .padding(.vertical, 20)
        
        Spacer()
        
        VStack {
          Spacer()
          /// --- Box - Regular material
          VStack {
            HStack {
              Image(systemName: viewModel.opponentMove?.imageName ?? "questionmark")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 30, minHeight: 30, maxHeight: 60)
                .padding([.leading], 30)
                .foregroundStyle(.red)
              Spacer()
              Text("VS.")
                .foregroundStyle(.secondary)
                .font(.largeTitle.weight(.semibold))
              Spacer()
              Image(systemName: viewModel.playerMove?.imageName ?? "questionmark")
                .resizable()
                .scaledToFit()
                .frame(minWidth: 30, minHeight: 30, maxHeight: 60)
                .padding([.trailing], 30)
                .foregroundStyle(.red)
            }
            
            Text(viewModel.shouldWin ? "Win" : "Lose")
              .font(.system(size: 40))
              .frame(minWidth: 20, minHeight: 20, maxHeight: 50)
              .foregroundStyle(.blue)
          }
          .frame(maxWidth: .infinity, minHeight: 200)
          .padding(.vertical, 20)
          .background(.regularMaterial)
          .clipShape(.rect(cornerRadius: 20))
          .alert(viewModel.scoreTitle, isPresented: $viewModel.isShowingScore) {
            Button("Continue", action: {
              if viewModel.count == viewModel.maxQuestionCount {
                viewModel.isFinalScoreShowing = true
              } else {
                viewModel.nextGame()
              }
            })
          } message: {
            Text(viewModel.alertMessage)
          }

          
          Spacer()
          /// --- Buttons
          Group {
            HStack {
              ForEach(viewModel.modelViewModels) { modelViewModel in
                Button(action: {
                  viewModel.playMove(modelViewModel)
                }) {
                  Image(systemName: "\(modelViewModel.imageName)")
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 30, minHeight: 30, maxHeight: 60)
                }
              }
              .buttonStyle(.bordered)
              .padding(10)
              .tint(.white)
              .foregroundStyle(.orange)
            }
            
            Text("Choose your weapon")
              .font(.system(size: 24, weight: .medium, design: .default))
              .foregroundStyle(.white)
              .padding(.vertical, 10)
          }
          
          Spacer()
        }
        
        Text("Total Score: \(viewModel.score)")
          .font(.system(size: 36, weight: .bold, design: .default))
          .foregroundColor(.white)
          .padding(.vertical, 20)
      }
      .padding()
    }
    .alert(viewModel.scoreTitle, isPresented: $viewModel.isFinalScoreShowing) {
      Button("Game Over") {
        viewModel.reset()
      }
    } message: {
      Text(viewModel.alertMessage)
    }

  }
}

#Preview {
  MainView(viewModel: MainViewModel())
}
