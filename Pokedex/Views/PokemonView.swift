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
  
  @State private var showAlert = false
  @State private var showAnimation = false
  
  let pokemon: Pokemon
  
  var body: some View {
    NavigationStack{
      ScrollView{
        VStack(spacing: 0){
          /* Header */
          ZStack{
            Circle()
              .fill(pokemon.getColorFromType(type: pokemon.types[0].name!).opacity(0.2))
              .shadow(color: pokemon.getColorFromType(type: pokemon.types[0].name!).opacity(1), radius: 10, x: 0, y: 0)
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
                  .background(pokemon.getColorFromType(type: type.name!))
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
                StatsItem(name: "HP", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.hp!)
                StatsItem(name: "Attaque", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.atk!)
                StatsItem(name: "Défense", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.def!)
                StatsItem(name: "Spé.Attaque", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.spe_atk!)
                StatsItem(name: "Spé.Défense", color: pokemon.getColorFromType(type: pokemon.types[0].name!), score: pokemon.stats!.spe_def!)
              }
            }
            .opacity(showAnimation ? 1 : 0)
            .animation(.easeInOut(duration: 0.4).delay(0.3), value: showAnimation)
            /* - */
            HStack{
              Spacer()
            }
          }
          .onAppear{
            showAnimation = true
          }
          .navigationBarBackButtonHidden(true)
          .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
              Button(action: {
                presentationMode.wrappedValue.dismiss()  // Action pour revenir en arrière
              }) {
                HStack {
                  Image(systemName: "chevron.left")  // Icône de flèche
                    .foregroundColor(pokemon.getColorFromType(type: pokemon.types[0].name!))  // Modifier la couleur de la flèche
                  Text("Retour")  // Optionnel, peut aussi cacher ce texte si tu veux juste la flèche
                    .foregroundColor(pokemon.getColorFromType(type: pokemon.types[0].name!))
                }
                .bold()
              }
            }
            ToolbarItem(placement: .topBarTrailing) {
              Button(action: {
                showAlert.toggle()
              }, label: {
                Image(systemName: "heart.fill")
                  .font(.title3)
                  .tint(.red)
                  .bold()
              })
            }
          }
          .alert("Favoris", isPresented: $showAlert) {
            Button(action: {showAlert.toggle()}, label: {
              Text("Annuler")
            })
            Button(action: {
              Task{
                await pokemon.addInFav()
              }
            }, label: {
              Text("Ajouter")
                .bold()
            })
          } message: {
            Text("Voulez-vous ajouter ce pokémon dans vos favoris ?")
          }
        }
      }
    }
  }
}

#Preview {
  LandingView()
}
