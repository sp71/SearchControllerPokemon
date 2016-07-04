//
//  PokemonDataSource.swift
//  SearchControllerPokemon
//
//  Created by Satinder Singh on 7/4/16.
//  Copyright © 2016 Satinder. All rights reserved.
//

import UIKit

class PokemonDataSource: NSObject {
    
    class func createList() -> [Pokemon] {
        return [Pokemon(name: "Bulbasaur", element: .Grass),
                Pokemon(name: "Ivysaur", element: .Grass),
                Pokemon(name: "Venusaur", element: .Grass),
                Pokemon(name: "Charmander", element: .Fire),
                Pokemon(name: "Charmeleon", element: .Fire),
                Pokemon(name: "Charizard", element: .Fire),
                Pokemon(name: "Squirtle", element: .Water),
                Pokemon(name: "Wartortle", element: .Water),
                Pokemon(name: "Blastoise", element: .Water)]
    }

}
