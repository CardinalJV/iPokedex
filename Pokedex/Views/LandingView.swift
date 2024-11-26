  //
  //  LandingView.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 02/09/2024.
  //

import SwiftUI
import TyradexKit

struct LandingView: View {
  
  @Environment(\.modelContext) private var context
  
  @StateObject private var pokemonRepo: PokemonRepository = .shared
  let pokemon_vm = PokemonViewModel()
  
  private let pokemonTypes = [ "Aucun", "Normal", "Vol", "Plante", "Insecte", "Feu", "Dragon", "Eau", "Glace", "Combat", "Acier", "Poison", "Ténèbres", "Fée", "Spectre", "Sol", "Roche", "Électrik", "Psy" ]
  @State private var selectedType = "Aucun"
  @State private var searchText = ""
  
  var body: some View {
    NavigationStack{
      VStack(spacing: 15){
        VStack {
          /* SearchBar */
          HStack{
            TextField("Rechercher un pokémon", text: $searchText)
            if !searchText.isEmpty {
              Button(action: { self.searchText.removeAll() }, label: {
                Image(systemName: "multiply.circle.fill")
                  .tint(.gray)
              })
            }
          }
          .frame(height: 10)
          .padding()
          .background(Color(.systemGray6))
          .cornerRadius(10)
          /* - */
          /* Picker de type */
          Menu{
            Picker("", selection: $selectedType) {
              ForEach(pokemonTypes, id: \.self) { type in
                Text(type)
                  .tag(type)
                  .foregroundStyle(.black)
              }
            }
          } label: {
            HStack {
              Text(selectedType == "Aucun" ? "Choisir un type" : selectedType)
              Spacer()
              Image(systemName: "chevron.down")
            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: 42.5)
            .foregroundStyle(selectedType == "Aucun" ? Color(.systemGray2) : .black)
            .background(selectedType == "Aucun" ? Color(.systemGray6) : pokemon_vm.getColorFromType(selectedType))
            .cornerRadius(10)
          }
          /* - */
        }
        /* Grille de pokémons */
        if self.pokemon_vm.favoritesIsLoading {
          Spacer()
          ProgressView()
            .tint(.red)
          Spacer()
        } else {
          ScrollView{
            LazyVGrid(columns: [GridItem(.flexible(), spacing: 15), GridItem(.flexible(), spacing: 15)], spacing: 15){
              ForEach(pokemon_vm.sortPokemons(searchText: self.searchText, type: self.selectedType)){ pokemon in
                NavigationLink(destination: PokemonView(pokemon_vm: self.pokemon_vm, pokemon: pokemon)) {
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
        /* - */
      }
      .padding()
      .fontDesign(.rounded)
      .ignoresSafeArea(edges: .bottom)
      .toolbar{
        ToolbarItem(placement: .topBarTrailing) {
          NavigationLink(destination: FavoritesPokemonsView(pokemon_vm: self.pokemon_vm)) {
            Image(systemName: "heart.fill")
              .font(.title3)
              .tint(.white)
              .bold()
          }
        }
        ToolbarItem(placement: .principal) {
          Text("Pokédex")
            .foregroundStyle(.white)
            .fontDesign(.rounded)
            .font(.title3)
            .bold()
        }
      }
      .navigationBarTitleDisplayMode(.inline)
      .toolbarBackground(.red, for: .navigationBar)
      .toolbarBackground(.visible, for: .navigationBar)
      .onAppear{
        self.pokemon_vm.context = self.context
      }
      .task{
        if pokemonRepo.pokemons.isEmpty {
          await pokemonRepo.fetchPokemons()
          pokemon_vm.pokemons = pokemonRepo.pokemons
          self.pokemon_vm.fetchPokemonData()
        }
      }
    }
  }
}

#Preview {
  LandingView()
    .modelContainer(for: PokemonData.self)
}
