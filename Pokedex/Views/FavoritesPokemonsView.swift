  //
  //  FavoritesPokemonsView.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 05/09/2024.
  //

import SwiftUI
import TyradexKit

struct FavoritesPokemonsView: View {
  
  @Environment(\.dismiss) private var dismiss
  
  let pokemon_vm: PokemonViewModel
  
  var body: some View {
    VStack{
      if pokemon_vm.favoritesIsLoading {
        ProgressView()
      } else {
        if pokemon_vm.favoritesPokemons.isEmpty {
          Text("Aucun Pokémon favori actuellement.")
        } else {
          ScrollView{
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10){
              ForEach(pokemon_vm.favoritesPokemons){ pokemon in
                NavigationLink(destination: PokemonView(pokemon_vm: pokemon_vm, pokemon: pokemon)) {
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
                  .background(pokemon_vm.getColorFromType(pokemon.types[0].name!).gradient)
                  .clipShape(.rect(cornerRadius: 10))
                }
              }
            }
          }
        }
      }
    }
    .navigationBarBackButtonHidden(true)
    .navigationBarTitleDisplayMode(.inline)
    .toolbar{
      ToolbarItem(placement: .topBarLeading) {
        Button(action: { dismiss() }) {
          Image(systemName: "chevron.left")
            .tint(.white)
            .bold()
        }
      }
      ToolbarItem(placement: .principal) {
        Text("Favoris")
          .foregroundStyle(.white)
          .font(.title3)
          .bold()
      }
    }
    .toolbarBackground(.red, for: .navigationBar)
    .toolbarBackground(.visible, for: .navigationBar)
    .padding()
  }
}
