  //
  //  PokemonView.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 02/09/2024.
  //

import SwiftUI
import TyradexKit

struct PokemonView: View {
  
  let pokemon: Pokemon
  
  var body: some View {
    VStack(spacing: 0){
      ZStack{
        Rectangle()
          .fill(pokemon.getColorFromType(type: pokemon.types[0].name!).gradient)
        ImageLoader(image: pokemon.sprites!.regular)
          .aspectRatio(contentMode: .fit)
          .shadow(color: .black, radius: 10, x: 0, y: 0)
          .frame(width: 250)
      }
      .frame(height: 300)
      HStack{
        ForEach(pokemon.types) { type in
          Text(type.name!)
            .padding(6)
            .background(pokemon.getColorFromType(type: type.name!))
            .bold()
            .clipShape(.rect(cornerRadius: 5))
        }
//        Spacer()
      }
      .padding()
      Spacer()
    }
  }
}

#Preview {
  LandingView()
}
