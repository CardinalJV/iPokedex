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
      .tint(self.pokemon_vm.getColorFromType(pokemon.types[0].name!))
      .bold()
      .font(.title3)
      .animation(.bouncy(duration: 0.5), value: show)
  }
  
  var body: some View {
    Button(action: {
      Task {
        pokemon_vm.isInFavorites(self.pokemon) ?
        pokemon_vm.deleteInFav(self.pokemon) :
        pokemon_vm.addInFav(self.pokemon)
      }
    }, label: {
      ZStack{
        image(Image(systemName: "heart.fill"), show: pokemon_vm.isInFavorites(pokemon))
        image(Image(systemName: "heart"), show: !pokemon_vm.isInFavorites(pokemon))
      }
    })
  }
}

  #Preview {
    LandingView()
  }
