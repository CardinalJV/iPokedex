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
    VStack(spacing: 0){
      ZStack{
        Rectangle()
          .fill(pokemon.getColorFromType(type: pokemon.types[0].name!).gradient)
        ImageLoader(image: pokemon.sprites!.regular)
          .aspectRatio(contentMode: .fit)
          .shadow(color: .black, radius: 10, x: 0, y: 0)
          .frame(width: 250)
      }
      .frame(height: 300)
      VStack(spacing: 10){
        HStack{
          ForEach(pokemon.types) { type in
            Text(type.name!)
              .padding(6)
              .background(pokemon.getColorFromType(type: type.name!))
              .bold()
              .clipShape(.rect(cornerRadius: 5))
          }
        }
        .padding()
        /* Composant a propos */
        VStack{
          Text("A propos")
            .bold()
          HStack(spacing: 50){
            VStack{
              HStack{
                Image(systemName: "scalemass")
                Text("\(String(format: "%.2f", pokemon.weight)) kg")
              }
              Text("Weight")
            }
            Divider()
            VStack{
              HStack{
                Image(systemName: "arrow.up.and.down")
                Text("\(String(format: "%.2f", pokemon.height)) m")
              }
              Text("Height")
            }
          }
          .frame(width: 350, height: 75)
          .background(Color(.systemGray6))
          .clipShape(.rect(cornerRadius: 10))
        }
        /* - */
        /* Composant statistiques */
        VStack{
          Text("Statistiques")
            .bold()
          VStack{
            StatsItem(name: "Hp", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.hp!)
            StatsItem(name: "Attaque", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.atk!)
            StatsItem(name: "Défense", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.def!)
            StatsItem(name: "Attaque !", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.spe_atk!)
            StatsItem(name: "Défense !", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.spe_def!)
          }
        }
        /* - */
        Spacer()
      }
      }
  }
}

#Preview {
  LandingView()
}
