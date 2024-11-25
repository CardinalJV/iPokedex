//
//  PokemonData.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 22/11/2024.
//

import Foundation
import SwiftData

@Model
class PokemonData: Identifiable {
  var id: Int
  
  init(id: Int) {
    self.id = id
  }
}
