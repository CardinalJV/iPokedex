<a href="https://developer.apple.com/swift/"> 
  <img src="https://raw.githubusercontent.com/CardinalJV/CardinalJV/main/assets/logo-swift/swift-96x96_2x.png" alt="Logo Swift" title="Swift" width="75" height="75"/></a>
<a href="https://developer.apple.com/xcode/swiftui/"> 
  <img src="https://raw.githubusercontent.com/CardinalJV/CardinalJV/main/assets/logo-swift/swiftui-96x96_2x.png" alt="SwiftUI" title="SwiftUI" width="75" height="75"/></a>
<a href="https://developer.apple.com/xcode/swiftdata/">
  <img src="https://raw.githubusercontent.com/CardinalJV/CardinalJV/main/assets/logo-swift/swiftdata-96x96_2x.png" alt="Logo SwiftData" title="SwiftData" width="75" height="75"/></a>

# Pokedex

Pokedex est une application iOS native qui permet aux utilisateurs de consulter et d'explorer des données sur les Pokémon. L'application suit l'architecture MVVM (Model-View-ViewModel) et récupère les données depuis un package externe. L'interface est conçue avec SwiftUI, offrant une expérience utilisateur fluide et réactive avec des animations améliorant l'expérience utilisateur.

## ScreenCast

https://github.com/user-attachments/assets/511b9fdd-3bf1-4b6b-8411-65d43ab7e59b

## Fonctionnalités principales

- Affichage des Pokémon :
  
Les Pokémon sont récupérés via une API externe.
Chaque Pokémon est présenté avec des détails comme son type, ses statistiques, et son image dans la vue PokemonView.swift.
Une liste interactive permet de naviguer parmi les Pokémon.

- Requêtes asynchrones :
  
Utilisation de async/await pour gérer les appels réseau.
Les données des Pokémon sont récupérées et traitées via le PokemonViewModel.swift, qui gère la logique de récupération et de traitement des informations.

- Gestion des favoris avec SwiftData :
  
Les utilisateurs peuvent enregistrer leurs pokémons favoris grace SwiftData.

- Architecture MVVM :
  
Le projet est structuré selon l'architecture MVVM pour une séparation claire entre la logique d'affichage (Vue) et la gestion des données (Modèle et ViewModel).
Le model est récupéré depuis un package externe, où les données des Pokémon sont modélisées.
La logique métier et la récupération des données sont centralisées dans PokemonViewModel.swift.

- Interface SwiftUI :
  
L'interface est entièrement construite en SwiftUI.
Utilisation de @State et @Observable pour gérer les états et les données dans les différentes vues.
Les composants réutilisables, comme les cartes de Pokémon, permettent une navigation fluide et un affichage dynamique.

## Détails techniques

- Langage : Swift
- Frameworks : SwiftUI / SwiftData
- Architecture : MVVM (Model-View-ViewModel)
- Récupération de données : Utilisation d'un package externe
- Version iOS supportée : iOS 14 et plus

## Installation

Clonez le projet depuis le dépôt GitHub, puis ouvrez-le dans Xcode. Assurez-vous que vous utilisez la dernière version de Xcode compatible avec Swift 5, SwiftUI et SwiftData pour éviter tout problème de compatibilité.

## Crédits

Toutes les données concernant les pokémons proviennent de l'API Tyradexkit.<br/>
https://tyradex.vercel.app
