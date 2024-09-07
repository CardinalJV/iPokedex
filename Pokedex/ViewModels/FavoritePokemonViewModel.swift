//
//  FavoritePokemonViewModel.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 07/09/2024.
//

import Foundation
import TyradexKit

@Observable
class FavoritePokemonViewModel {
  
  var favoritesPokemons = [Pokemon]()
  
  func addInFav(pokemon: Pokemon) async {
    favoritesPokemons.append(pokemon)
  }
  
  func deleteInFav(pokemon: Pokemon) async {
    favoritesPokemons.removeAll(where: { $0.id == pokemon.id })
  }
  
  func isInFavorites(pokemon: Pokemon) -> Bool {
    return favoritesPokemons.contains(where: { $0.id == pokemon.id })
  }
}
