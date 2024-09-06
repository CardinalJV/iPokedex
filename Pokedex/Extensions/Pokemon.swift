//
//  PokemonRepository.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 02/09/2024.
//

import Foundation
import SwiftUI
import TyradexKit

var favoritesPokemons = [Pokemon]()
var isTaskRunning = false

extension Pokemon {
  func getColorFromType(type: String) -> Color {
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
  
  func addInFav() async {
    isTaskRunning = true
    favoritesPokemons.append(self)
    isTaskRunning = false
  }
  
  func deleteInFav() async {
    favoritesPokemons.removeAll(where: { $0.id == self.id})
  }
  
  func isInFavorites() -> Bool {
    return favoritesPokemons.contains(where: { $0.id == self.id })
  }
}
