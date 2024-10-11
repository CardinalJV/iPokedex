<a href="https://developer.apple.com/xcode/swiftui/"> 
  <img src="https://raw.githubusercontent.com/CardinalJV/CardinalJV/main/assets/logo-swift/swiftui-96x96_2x.png" alt="SwiftUI" title="SwiftUI" width="75" height="75"/>
</a>

----

# Pokedex

Pokedex est une application iOS native qui permet aux utilisateurs de consulter et d'explorer des données sur les Pokémon. L'application suit l'architecture MVVM (Model-View-ViewModel) et récupère les données depuis un package externe. L'interface est conçue avec SwiftUI, offrant une expérience utilisateur fluide et réactive avec des animations améliorant l'expérience utilisateur.

## Fonctionnalités principales

- Affichage des Pokémon :
  
Les Pokémon sont récupérés via une API externe.
Chaque Pokémon est présenté avec des détails comme son type, ses statistiques, et son image dans la vue PokemonView.swift.
Une liste interactive permet de naviguer parmi les Pokémon.

- Requêtes asynchrones :
  
Utilisation de async/await pour gérer les appels réseau.
Les données des Pokémon sont récupérées et traitées via le PokemonViewModel.swift, qui gère la logique de récupération et de traitement des informations.

- Gestion des favoris :
  
Les utilisateurs peuvent marquer leurs Pokémon préférés et les consulter dans la vue FavoritesPokemonsView.swift.

- Architecture MVVM :
  
Le projet est structuré selon l'architecture MVVM pour une séparation claire entre la logique d'affichage (Vue) et la gestion des données (Modèle et ViewModel).
Modèles : Les modèles sont définis dans PokemonData.swift, où les données des Pokémon sont modélisées.
ViewModels : La logique métier et la récupération des données sont centralisées dans PokemonViewModel.swift.

- Interface SwiftUI :
  
L'interface est entièrement construite en SwiftUI.
Utilisation de @State et @Observable pour gérer les états et les données dans les différentes vues.
Les composants réutilisables, comme les cartes de Pokémon, permettent une navigation fluide et un affichage dynamique.

## Détails techniques

- Langage : Swift
- Frameworks : SwiftUI
- Architecture : MVVM (Model-View-ViewModel)
- Récupération de données : Utilisation d'un package externe(Crédits: https://tyradex.vercel.app)
- Version iOS supportée : iOS 14 et plus

## Installation

Clonez le projet depuis le dépôt GitHub, puis ouvrez-le dans Xcode. Assurez-vous que vous utilisez la dernière version de Xcode compatible avec Swift 5 et SwiftUI pour éviter tout problème de compatibilité.

## ScreenCast

https://github.com/user-attachments/assets/1a2a1d36-c31c-400e-9fdb-0354abed53da
