//
//  FavoritePokemonViewModel.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 07/09/2024.
//

import Foundation
import TyradexKit

@Observable
class PokemonViewModel {
  
  var pokemons = [Pokemon]()
  
  var favoritesPokemons = [Pokemon]()
  
  func addInFav(pokemon: Pokemon) async {
    return favoritesPokemons.append(pokemon)
  }
  
  func deleteInFav(pokemon: Pokemon) async {
    return favoritesPokemons.removeAll(where: { $0.id == pokemon.id })
  }
  
  func isInFavorites(pokemon: Pokemon) -> Bool {
    return favoritesPokemons.contains(where: { $0.id == pokemon.id })
  }
  
  func sortPokemons(searchText: String) -> [Pokemon] {
    return pokemons.filter { $0.name!.fr!.localizedCaseInsensitiveContains(searchText) }
  }
  
  func sortPokemonsByType(type: String) -> [Pokemon] {
    return pokemons.filter { $0.types[0].name!.localizedCaseInsensitiveContains(type)}
  }
  
  func getEvolutions(for pokemon: Pokemon) -> [Pokemon] {
    guard let evolution = pokemon.evolution else {
      return []
    }
    
    let preEvolutionIDs = evolution.pre?.compactMap { $0.pokedexID } ?? []
    let nextEvolutionIDs = evolution.next?.compactMap { $0.pokedexID } ?? []
    
    let evolutionIDs = preEvolutionIDs + nextEvolutionIDs

    return self.pokemons.filter { evolutionIDs.contains($0.pokedexID ?? -1) }
  }
}
