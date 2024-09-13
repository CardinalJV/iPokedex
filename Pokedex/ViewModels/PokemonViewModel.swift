  //
  //  FavoritePokemonViewModel.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 07/09/2024.
  //

import TyradexKit
import SwiftUI

@Observable
class PokemonViewModel {
  
  var pokemons = [Pokemon]()
  
  var favoritesPokemons = [Pokemon]()
  
  func getColorFromType(_ type: String) -> Color {
    switch type {
      case "Normal", "Vol": return .orange
      case "Plante", "Insecte": return .green
      case "Feu", "Dragon": return .red
      case "Eau", "Glace": return .blue
      case "Combat", "Acier": return .gray
      case "Poison", "Ténèbres": return .purple
      case "Fée", "Spectre": return .pink
      case "Sol", "Roche": return .brown
      case "Électrik", "Psy": return .yellow
      default: return .white
    }
  }
  
  func addInFav(_ pokemon: Pokemon) async {
    return favoritesPokemons.append(pokemon)
  }
  
  func deleteInFav(_ pokemon: Pokemon) async {
    return favoritesPokemons.removeAll(where: { $0.id == pokemon.id })
  }
  
  func isInFavorites(_ pokemon: Pokemon) -> Bool {
    return favoritesPokemons.contains(where: { $0.id == pokemon.id })
  }
  
  func sortPokemons(searchText: String) -> [Pokemon] {
    if let index = Int(searchText) {
      return pokemons.filter { $0.pokedexID! == index }
    } else {
      return pokemons.filter { $0.name!.fr!.localizedCaseInsensitiveContains(searchText) }
    }
  }
  
  func sortPokemonsByType(_ type: String) -> [Pokemon] {
    if type == "Aucun" {
      return self.pokemons
    } else {
      return pokemons.filter { $0.types[0].name!.localizedCaseInsensitiveContains(type)}
    }
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
