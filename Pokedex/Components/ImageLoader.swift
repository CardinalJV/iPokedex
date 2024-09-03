//
//  ImageLoader.swift
//  Pokedex
//
//  Created by Jessy Viranaiken on 02/09/2024.
//

import SwiftUI

struct ImageLoader: View {
  
  let image: String
  
  var body: some View {
    AsyncImage(url: URL(string: image)){ image in
      image.image?.resizable()
    }
  }
}
