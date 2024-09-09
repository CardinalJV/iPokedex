//
//  Test.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 04/09/2024.
//

import SwiftUI

struct ScaleEffectAnimationView: View {
  @State private var isVisible = false
  
  var body: some View {
    VStack(spacing: 20) {
      ForEach(0..<5) { index in
        Text("Élément \(index + 1)")
          .font(.title)
          .padding()
          .background(Color.green)
          .cornerRadius(10)
          .foregroundColor(.white)
          .scaleEffect(isVisible ? 1 : 0.1)  // Commence petit, puis s'agrandit
          .animation(.spring().delay(Double(index) * 0.2), value: isVisible)  // Utilise un effet de ressort
      }
    }
    .onAppear {
      isVisible = true
    }
  }
}

struct OpacityAnimationView: View {
  @State private var isVisible = false
  
  var body: some View {
    VStack(spacing: 20) {
      ForEach(0..<5) { index in
        Text("Élément \(index + 1)")
          .font(.title)
          .padding()
          .background(Color.blue)
          .cornerRadius(10)
          .foregroundColor(.white)
          .opacity(isVisible ? 1 : 0)  // Commence invisible, puis devient visible
          .animation(.easeInOut(duration: 0.5).delay(Double(index) * 0.2), value: isVisible)
      }
    }
    .onAppear {
      isVisible = true
    }
  }
}

struct RotationEffectAnimationView: View {
  @State private var isVisible = false
  
  var body: some View {
    VStack(spacing: 20) {
      ForEach(0..<5) { index in
        Text("Élément \(index + 1)")
          .font(.title)
          .padding()
          .background(Color.purple)
          .cornerRadius(10)
          .foregroundColor(.white)
          .rotationEffect(.degrees(isVisible ? 0 : 180))  // Commence en rotation, puis se redresse
          .animation(.easeInOut(duration: 0.6).delay(Double(index) * 0.2), value: isVisible)
      }
    }
    .onAppear {
      isVisible = true
    }
  }
}

struct ScaleAndOpacityAnimationView: View {
  @State private var isVisible = false
  
  var body: some View {
    VStack(spacing: 20) {
      ForEach(0..<5) { index in
        Text("Élément \(index + 1)")
          .font(.title)
          .padding()
          .background(Color.orange)
          .cornerRadius(10)
          .foregroundColor(.white)
          .scaleEffect(isVisible ? 1 : 0.1)  // Commence petit
          .opacity(isVisible ? 1 : 0)  // Commence transparent
          .animation(.easeOut(duration: 0.5).delay(Double(index) * 0.2), value: isVisible)
      }
    }
    .onAppear {
      isVisible = true
    }
  }
}

struct OffsetAndBlurAnimationView: View {
  @State private var isVisible = false
  
  var body: some View {
    VStack(spacing: 20) {
      ForEach(0..<5) { index in
        Text("Élément \(index + 1)")
          .font(.title)
          .padding()
          .background(Color.red)
          .cornerRadius(10)
          .foregroundColor(.white)
          .offset(y: isVisible ? 0 : 300)  // Déplacement depuis le bas
          .blur(radius: isVisible ? 0 : 10)  // Commence flou, puis devient net
          .animation(.easeOut(duration: 0.5).delay(Double(index) * 0.2), value: isVisible)
      }
    }
    .onAppear {
      isVisible = true
    }
  }
}




//#Preview {ScaleEffectAnimationView()}
#Preview {OpacityAnimationView()}
//#Preview {RotationEffectAnimationView()}
//#Preview { ScaleEffectAnimationView()}
//#Preview { OffsetAndBlurAnimationView() }

