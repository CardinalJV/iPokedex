  //
  //  PokemonViewModel.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 07/09/2024.
  //

import TyradexKit
import SwiftUI
import SwiftData

@Observable
class PokemonViewModel {
  
  var context: ModelContext? = nil
  
  var pokemons = [Pokemon]()
  
  var favoritesPokemons = [Pokemon]()
  var favoritesIsLoading = true
  
  @ObservationIgnored private var pokemonDatas = [PokemonData]()
  
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
  
  func fetchPokemonData() {
    guard let context = self.context else {
      print("Context error")
      return
    }
    do {
        // Fetching data
      let descriptor = FetchDescriptor<PokemonData>()
      self.pokemonDatas = try context.fetch(descriptor)
        // Convert data to Pokemon
      for pokemon in self.pokemons where self.pokemonDatas.contains(where: { $0.id == pokemon.pokedexID! }) {
        self.favoritesPokemons.append(pokemon)
      }
      self.favoritesIsLoading = false
    } catch {
      print("Error during fetching data in local storage: \(error.localizedDescription)")
    }
  }
  
  func addInFav(_ pokemon: Pokemon) {
    guard let context = self.context, let pokedexID = pokemon.pokedexID else {
      print("Context or pokemon has a error")
      return
    }
    self.favoritesPokemons.append(pokemon)
    do {
      context.insert(PokemonData(id: pokedexID))
      try context.save()
    } catch {
      print("Error during adding in local storage: \(error.localizedDescription)")
    }
  }
  
  func deleteInFav(_ pokemon: Pokemon) {
    guard let context = self.context, let pokedexID = pokemon.pokedexID else {
      print("Context or pokemon has a error")
      return
    }
    self.favoritesPokemons.removeAll(where: { $0.id == pokemon.id })
    do {
      for pokemonData in pokemonDatas {
        if pokemonData.id == pokedexID {
          context.delete(pokemonData)
          try context.save()
        }
      }
    } catch {
      print("Error during deleting in local storage: \(error.localizedDescription)")
    }
  }
  
  func isInFavorites(_ pokemon: Pokemon) -> Bool {
    return favoritesPokemons.contains(where: { $0.id == pokemon.id })
  }
  
  func sortPokemons(searchText: String, type: String) -> [Pokemon] {
    let filteredBySearchText: [Pokemon]
    if let index = Int(searchText) {
      filteredBySearchText = pokemons.filter { $0.pokedexID! == index }
    } else if !searchText.isEmpty {
      filteredBySearchText = pokemons.filter { $0.name!.fr!.localizedCaseInsensitiveContains(searchText) }
    } else {
      filteredBySearchText = pokemons
    }
    
    if type == "Aucun" {
      return filteredBySearchText
    } else {
      return filteredBySearchText.filter { $0.types[0].name!.localizedCaseInsensitiveContains(type) }
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
