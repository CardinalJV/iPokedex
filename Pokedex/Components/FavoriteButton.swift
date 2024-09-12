  //
  //  FavoriteButton.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 11/09/2024.
  //

import SwiftUI
import TyradexKit

struct FavoriteButton: View {
  
  let pokemon_vm: PokemonViewModel
  let pokemon: Pokemon
  
  func image(_ image: Image, show: Bool) -> some View {
    image
      .scaleEffect(show ? 1 : 0)
      .tint(self.pokemon.getColorFromType(type: pokemon.types[0].name!))
      .bold()
      .font(.title3)
      .animation(.easeInOut(duration: 0.3), value: show)
  }
  
  var body: some View {
    Button(action: {
      Task {
        pokemon_vm.isInFavorites(pokemon: self.pokemon) ?
        await pokemon_vm.deleteInFav(pokemon: self.pokemon) :
        await pokemon_vm.addInFav(pokemon: self.pokemon)
      }
    }, label: {
      ZStack{
          image(Image(systemName: "heart.fill"), show: pokemon_vm.isInFavorites(pokemon: pokemon))
          image(Image(systemName: "heart"), show: !pokemon_vm.isInFavorites(pokemon: pokemon))
      }
    })
  }
}

  #Preview {
    LandingView()
  }
