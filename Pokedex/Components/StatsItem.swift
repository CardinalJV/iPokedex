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
  @State var score: Int
  let maxScore = 100
  
    var body: some View {
      HStack{
        Text(name)
          .frame(width: 100, alignment: .leading)
        Spacer()
        Text("\(score)")
        Spacer()
        ProgressView(value: Double(score)/Double(maxScore))
          .progressViewStyle(LinearProgressViewStyle())
          .tint(color)
          .frame(width: 100)
      }
      .frame(width: 350)
    }
}

#Preview {
  StatsItem(name: "HP", color: .blue, score: 25)
}
