  //
  //  FavoritesPokemonsView.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 05/09/2024.
  //

import SwiftUI
import TyradexKit

struct FavoritesPokemonsView: View {
  
  var favoritePokemon_vm: FavoritePokemonViewModel
  
  var body: some View {
    NavigationStack{
      VStack{
        if favoritePokemon_vm.favoritesPokemons.isEmpty {
          Text("Aucun pokémon favoris pour le moments.")
        } else {
          ScrollView{
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10){
              ForEach(favoritePokemon_vm.favoritesPokemons){ pokemon in
                NavigationLink(destination: PokemonView(favoritePokemon_vm: favoritePokemon_vm, pokemon: pokemon)) {
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
      }
      .padding()
      .toolbarBackground(.red, for: .navigationBar)
    }
  }
}
