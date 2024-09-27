//
//  PokemonData.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 12/09/2024.
//

import SwiftData

@Model
class PokemonData: Model {
  @Attribute(.unique) var id: UUID
  var pokedexID: Int
  var generation: Int?
  var category: String?
  var name: String?
  var spriteRegularURL: String?
  var spriteShinyURL: String?
  var types: String
  var talents: String
  var stats: PokemonStatsData?
  var resistances: String
  var evolution: String?
  var height: Double
  var weight: Double
  var eggGroups: String
  var catchRate: Int
  var level100: Int
  
  init(pokemon: Pokemon) {
    self.id = pokemon.id
    self.pokedexID = pokemon.pokedexID ?? 0
    self.generation = pokemon.generation
    self.category = pokemon.category
    self.name = pokemon.nameLocalized
    self.spriteRegularURL = pokemon.sprites?.regular
    self.spriteShinyURL = pokemon.sprites?.shiny
    self.types = pokemon.types.map { $0.name }.joined(separator: ", ")
    self.talents = pokemon.talents.map { $0.name }.joined(separator: ", ")
    self.stats = PokemonStatsData(stats: pokemon.stats)
    self.resistances = pokemon.resistances.map { "\($0.name): \($0.multiplier)" }.joined(separator: ", ")
    self.evolution = pokemon.evolution?.pre.map { $0.name }.joined(separator: ", ")
    self.height = pokemon.height
    self.weight = pokemon.weight
    self.eggGroups = pokemon.eggGroups.joined(separator: ", ")
    self.catchRate = pokemon.catchRate
    self.level100 = pokemon.level100
  }
}

@Model
class PokemonStatsData: Model {
  var hp: Int
  var atk: Int
  var def: Int
  var vit: Int
  var speAtk: Int
  var speDef: Int
  
  init(stats: PokemonStats?) {
    self.hp = stats?.hp ?? 0
    self.atk = stats?.atk ?? 0
    self.def = stats?.def ?? 0
    self.vit = stats?.vit ?? 0
    self.speAtk = stats?.spe_atk ?? 0
    self.speDef = stats?.spe_def ?? 0
  }
}

