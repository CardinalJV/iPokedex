//
//  PokemonRepo.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 04/09/2024.
//

import Foundation
import TyradexKit

extension PokemonRepository {
  func sortPokemons(searchText: String) -> [Pokemon] {
    return pokemons.filter { $0.name!.fr!.localizedCaseInsensitiveContains(searchText) }
  }
}
