//
//  PokedexApp.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 02/09/2024.
//

import SwiftUI
import SwiftData

@main
struct PokedexApp: App {
    var body: some Scene {
        WindowGroup {
            LandingView()
        }
        .modelContainer(for: PokemonData.self)
    }
}
