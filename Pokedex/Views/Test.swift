//
//  Test.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 13/09/2024.
//

import SwiftUI

struct Test: View {
  private let pokemonTypes = [ "Aucun", "Normal", "Vol", "Plante", "Insecte", "Feu", "Dragon", "Eau", "Glace", "Combat", "Acier", "Poison", "Ténèbres", "Fée", "Spectre", "Sol", "Roche", "Électrik", "Psy" ]
  @State var selectedType = "Aucun"
  
    var body: some View {
      VStack{
        Picker(selection: $selectedType) {
          ForEach(pokemonTypes, id: \.self) { type in
            Text(type)
              .tag(type)
              .foregroundStyle(.black)
          }
        } label: {
          HStack {
            Text(selectedType == "Aucun" ? "Choisir un type" : selectedType)
              .foregroundColor(.black)
            Spacer()
            Image(systemName: "chevron.down")
              .foregroundColor(.white)
          }
          .padding()
          .frame(width: 330, height: 10)
          .background(.blue)
          .cornerRadius(10)
        }
        
        Picker(selection: $selectedType) {
          ForEach(pokemonTypes, id: \.self) {
            Text($0).tag($0)
          }
        } label: {
          HStack{
            ZStack{
              RoundedRectangle(cornerRadius: 5)
                .foregroundStyle(.black)
                .frame(width: 30, height: 30)
              Text("!")
                .font(.title2)
                .foregroundStyle(.white)
                .bold()
            }
            Text("Priorité")
          }
        }

      }
    }
}

#Preview {
    Test()
}
