//
//  PokemonView.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 02/09/2024.
//

import SwiftUI
import TyradexKit

struct PokemonView: View {
  
  let pokemon: Pokemon
  
  var body: some View {
    ImageLoader(pokemonImage: pokemon.sprites!.regular)
      .aspectRatio(contentMode: .fit)
  }
}
