//
//  TestView.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 04/09/2024.
//

import SwiftUI

struct TestView: View {
  
  @Binding var isPresented: Bool
  
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//  .fullScreenCover(isPresented: $isDetailViewPresented, content: {
//    DetailView(isPresented: $isDetailViewPresented)
//      .scaleEffect(scale)
//      .onAppear {
//        withAnimation(.easeInOut(duration: 0.5)) {
//          scale = 1.0
//        }
//      }
//      .onDisappear {
//        scale = 0.5
//      }
//  })

#Preview {
    TestView()
}
