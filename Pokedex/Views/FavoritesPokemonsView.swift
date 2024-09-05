//
//  FavoritesPokemonsView.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 05/09/2024.
//

import SwiftUI
import TyradexKit

struct FavoritesPokemonsView: View {
  
  @StateObject private var pokemonRepo: PokemonRepository = .shared
  
    var body: some View {
      NavigationStack{
        VStack{
          ScrollView{
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10){
              ForEach(favoritesPokemons){ pokemon in
                NavigationLink(destination: PokemonView(pokemon: pokemon)) {
                  VStack{
                    ImageLoader(image: pokemon.sprites!.regular)
                      .aspectRatio(contentMode: .fit)
                      .shadow(color: .black, radius: 10, x: 0, y: 0)
                    Text(pokemon.name!.fr!)
                    Text("#\(pokemon.pokedexID!)")
                  }
                  .foregroundStyle(.black)
                  .padding()
                  .bold()
                  .frame(width: 175, height: 175)
                  .background(pokemon.getColorFromType(type: pokemon.types[0].name!).gradient)
                  .clipShape(.rect(cornerRadius: 10))
                }
              }
            }
          }
        }
        .padding()
        .onAppear{
          Task{
            await pokemonRepo.fetchPokemons()
          }
        }
      }
    }
}

#Preview {
    FavoritesPokemonsView()
}
