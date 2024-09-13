  //
  //  PokemonView.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 02/09/2024.
  //

import SwiftUI
import TyradexKit

struct PokemonView: View {
  
  @Environment(\.dismiss) private var dismiss
  
  var pokemon_vm: PokemonViewModel
  let pokemon: Pokemon
  
  @State var showToast = false
  @State private var showAnimation = false
  
  var body: some View {
    NavigationStack{
      ScrollView{
        VStack(spacing: 0){
          /* Header */
          ZStack{
            Circle()
              .fill(pokemon_vm.getColorFromType(pokemon.types[0].name!))
              .shadow(color: pokemon_vm.getColorFromType(pokemon.types[0].name!).opacity(1), radius: 10, x: 0, y: 0)
              .blur(radius: 10)
              .scaleEffect(self.showAnimation ? 1 : 0)
              .animation(.smooth(duration: 0.3).delay(0.2), value: self.showAnimation)
            VStack(spacing: 5){
              TabView {
                VStack{
                  ImageLoader(image: pokemon.sprites!.regular)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                  Text(pokemon.name!.fr!)
                    .font(.title3)
                    .bold()
                }
                VStack{
                  ImageLoader(image: pokemon.sprites!.shiny)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                  Text("\(pokemon.name!.fr!) (Shiny)")
                    .font(.title3)
                    .bold()
                }
              }
              .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
              Text("#\(pokemon.pokedexID!)")
            }
          }
          .frame(height: 300)
          .scaleEffect(self.showAnimation ? 1 : 0)
          .animation(.bouncy(duration: 0.3).delay(0.2), value: showAnimation)
          /* - */
          VStack(spacing: 10){
            /* Composant types */
            HStack{
              ForEach(pokemon.types) { type in
                Text(type.name!)
                  .padding(6)
                  .background(pokemon_vm.getColorFromType(type.name!))
                  .bold()
                  .clipShape(.rect(cornerRadius: 5))
              }
            }
            .padding()
            .opacity(showAnimation ? 1 : 0)
            .animation(.bouncy(duration: 0.4).delay(0.4), value: showAnimation)
            /* - */
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
            .opacity(showAnimation ? 1 : 0)
            .animation(.bouncy(duration: 0.4).delay(0.4), value: showAnimation)
            /* - */
            /* Composant statistiques */
            VStack{
              Text("Statistiques")
                .bold()
              VStack{
                StatsItem(name: "HP", color: pokemon_vm.getColorFromType(pokemon.types[0].name!), score: pokemon.stats!.hp!)
                StatsItem(name: "Attaque", color: pokemon_vm.getColorFromType(pokemon.types[0].name!), score: pokemon.stats!.atk!)
                StatsItem(name: "Défense", color: pokemon_vm.getColorFromType(pokemon.types[0].name!), score: pokemon.stats!.def!)
                StatsItem(name: "Spé.Attaque", color: pokemon_vm.getColorFromType(pokemon.types[0].name!), score: pokemon.stats!.spe_atk!)
                StatsItem(name: "Spé.Défense", color: pokemon_vm.getColorFromType(pokemon.types[0].name!), score: pokemon.stats!.spe_def!)
              }
            }
            .opacity(showAnimation ? 1 : 0)
            .animation(.bouncy(duration: 0.4).delay(0.5), value: showAnimation)
            /* - */
            /* Composant évolutions */
            if !pokemon_vm.getEvolutions(for: pokemon).isEmpty {
              VStack(spacing: 0){
                Text("Évolutions")
                  .bold()
                HStack(spacing: 10){
                  ForEach(pokemon_vm.getEvolutions(for: pokemon)) { pokemon in
                    VStack{
                      ImageLoader(image: pokemon.sprites!.regular)
                        .aspectRatio(contentMode: .fit)
                        .shadow(color: .black, radius: 10, x: 0, y: 0)
                      Text(pokemon.name!.fr!)
                      Text("#\(pokemon.pokedexID!)")
                    }
                    .foregroundStyle(.black)
                    .padding()
                    .bold()
                    .frame(width: 175, height: 175)
                    .background(pokemon_vm.getColorFromType(pokemon.types[0].name!).gradient)
                    .clipShape(.rect(cornerRadius: 10))
                  }
                  if pokemon_vm.getEvolutions(for: self.pokemon).count == 1 {
                    Spacer()
                  }
                }
                .padding()
              }
              .opacity(showAnimation ? 1 : 0)
              .animation(.bouncy(duration: 0.4).delay(0.6), value: showAnimation)
            }
            /* - */
          }
        }
        .onAppear{
          showAnimation = true
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
              dismiss()
            }) {
              HStack {
                Image(systemName: "chevron.left")
                  .foregroundColor(pokemon_vm.getColorFromType(pokemon.types[0].name!))
                Text("Retour")
                  .foregroundColor(pokemon_vm.getColorFromType(pokemon.types[0].name!))
              }
              .bold()
            }
          }
          ToolbarItem(placement: .topBarTrailing) {
            FavoriteButton(pokemon_vm: self.pokemon_vm, pokemon: self.pokemon)
          }
        }
      }
    }
  }
}

#Preview {
  LandingView()
}
