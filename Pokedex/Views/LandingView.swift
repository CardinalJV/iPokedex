  //
  //  ContentView.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 02/09/2024.
  //

import SwiftUI
import TyradexKit

struct LandingView: View {
  
  @StateObject private var pokemonRepo: PokemonRepository = .shared
  @State private var searchText = ""
  
  var body: some View {
    NavigationStack{
      VStack{
        TextField("Rechercher un pokémon", text: $searchText)
          .frame(height: 10)
          .padding()
          .background(Color(.systemGray6))
          .cornerRadius(10)
        ScrollView{
          LazyVGrid(columns: [GridItem(.flexible(), spacing: 10), GridItem(.flexible(), spacing: 10)], spacing: 10){
            ForEach(searchText.isEmpty ? pokemonRepo.pokemons : pokemonRepo.sortPokemons(searchText: self.searchText)){ pokemon in
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
      .ignoresSafeArea(edges: .bottom)
      .onAppear{
        Task{
          await pokemonRepo.fetchPokemons()
        }
      }
      .toolbar{
        ToolbarItem(placement: .topBarLeading) {
          Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Image(systemName: "heart.fill")
              .font(.title3)
              .tint(.white)
              .bold()
          })
        }
      }
      .toolbarBackground(.red, for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
    }
  }
}


#Preview {
  LandingView()
}
