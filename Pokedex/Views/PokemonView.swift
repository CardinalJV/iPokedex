  //
  //  PokemonView.swift
  //  Pokedex
  //
  //  Created by Jessy Viranaiken on 02/09/2024.
  //

import SwiftUI
import TyradexKit

struct PokemonView: View {
  
  @Environment(\.presentationMode) var presentationMode
  
  var pokemon_vm: PokemonViewModel
  let pokemon: Pokemon
  
  @State private var showAlert = false
  @State private var showAnimation = false
  
  var body: some View {
    NavigationStack{
      ScrollView{
        VStack(spacing: 0){
          /* Header */
          ZStack{
            Circle()
              .fill(pokemon.getColorFromType())
              .shadow(color: pokemon.getColorFromType().opacity(1), radius: 10, x: 0, y: 0)
              .blur(radius: 10)
            VStack{
              ImageLoader(image: pokemon.sprites!.regular)
                .aspectRatio(contentMode: .fit)
                .frame(width: 250)
              Text(pokemon.name!.fr!)
                .font(.title3)
                .bold()
              Text("#\(pokemon.pokedexID!)")
            }
          }
          .frame(height: 300)
          .opacity(showAnimation ? 1 : 0)
          .animation(.easeInOut(duration: 0.4), value: showAnimation)
          /* - */
          VStack(spacing: 10){
            /* Composant types */
            HStack{
              ForEach(pokemon.types) { type in
                Text(type.name!)
                  .padding(6)
                  .background(pokemon.getColorFromType())
                  .bold()
                  .clipShape(.rect(cornerRadius: 5))
              }
            }
            .padding()
            .opacity(showAnimation ? 1 : 0)
            .animation(.easeInOut(duration: 0.4).delay(0.1), value: showAnimation)
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
            .animation(.easeInOut(duration: 0.4).delay(0.2), value: showAnimation)
            /* - */
            /* Composant statistiques */
            VStack{
              Text("Statistiques")
                .bold()
              VStack{
                StatsItem(name: "HP", color: pokemon.getColorFromType(), score: pokemon.stats!.hp!)
                StatsItem(name: "Attaque", color: pokemon.getColorFromType(), score: pokemon.stats!.atk!)
                StatsItem(name: "Défense", color: pokemon.getColorFromType(), score: pokemon.stats!.def!)
                StatsItem(name: "Spé.Attaque", color: pokemon.getColorFromType(), score: pokemon.stats!.spe_atk!)
                StatsItem(name: "Spé.Défense", color: pokemon.getColorFromType(), score: pokemon.stats!.spe_def!)
              }
            }
            .opacity(showAnimation ? 1 : 0)
            .animation(.easeInOut(duration: 0.4).delay(0.3), value: showAnimation)
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
                    .background(pokemon.getColorFromType().gradient)
                    .clipShape(.rect(cornerRadius: 10))
                  }
                }
                .padding()
              }
              .opacity(showAnimation ? 1 : 0)
              .animation(.easeInOut(duration: 0.4).delay(0.4), value: showAnimation)
            }
          }
          /* - */
        }
        .onAppear{
          showAnimation = true
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
          ToolbarItem(placement: .navigationBarLeading) {
            Button(action: {
              presentationMode.wrappedValue.dismiss()
            }) {
              HStack {
                Image(systemName: "chevron.left")
                  .foregroundColor(pokemon.getColorFromType())
                Text("Retour")
                  .foregroundColor(pokemon.getColorFromType())
              }
              .bold()
            }
          }
          ToolbarItem(placement: .topBarTrailing) {
            Button(action: {
              showAlert.toggle()
            }, label: {
              Image(systemName: pokemon_vm.isInFavorites(pokemon: self.pokemon) ?
                    "heart.fill" :
                      "heart"
              )
              .font(.title3)
              .foregroundStyle(pokemon.getColorFromType())
              .bold()
            })
          }
        }
        .alert("Favoris", isPresented: $showAlert) {
          Button(action: { showAlert.toggle() }, label: {
            Text("Annuler")
          })
          Button(action: {
            Task {
              pokemon_vm.isInFavorites(pokemon: self.pokemon) ?
              await pokemon_vm.deleteInFav(pokemon: self.pokemon) :
              await pokemon_vm.addInFav(pokemon: self.pokemon)
            }
          }, label: {
            Text(pokemon_vm.isInFavorites(pokemon: self.pokemon) ? "Supprimer" : "Ajouter")
              .bold()
          })
        } message: {
          Text(pokemon_vm.isInFavorites(pokemon: self.pokemon) ? "Voulez-vous supprimer ce pokémon de vos favoris ?" : "Voulez-vous ajouter ce pokémon dans vos favoris ?")
        }
      }
    }
  }
}
