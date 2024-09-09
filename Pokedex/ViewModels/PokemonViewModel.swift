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
  
  func getPokemons(pokemons: [Pokemon]) async {
    self.pokemons = pokemons
  }
  
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
}
