  //
  //  StatsItem.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 03/09/2024.
  //

import SwiftUI

struct StatsItem: View {
  
  let name: String
  let color: Color
  let score: Int
  @State var initialScore = 0
  
  var body: some View {
    HStack{
      Text(name)
        .frame(width: 100, alignment: .leading)
      Spacer()
      Text("\(score)")
      Spacer()
      ProgressView(value: Double(self.initialScore), total: 100)
        .progressViewStyle(LinearProgressViewStyle())
        .tint(color)
        .frame(width: 100)
        .onAppear{
          DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            withAnimation(.smooth(duration: 0.5)) {
              self.initialScore = self.score
            }
          }
        }
    }
    .frame(width: 350)
  }
}

#Preview {
  StatsItem(name: "HP", color: .blue, score: 25)
}
