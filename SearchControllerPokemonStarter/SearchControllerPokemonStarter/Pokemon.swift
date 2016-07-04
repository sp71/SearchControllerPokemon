//
//  SearchControllerPokemonStarter.swift
//  SearchControllerPokemon
//
//  Created by Satinder Singh on 7/4/16.
//  Copyright © 2016 Satinder. All rights reserved.
//

import UIKit

class Pokemon: NSObject {
    
    let name: String
    let image: UIImage?
    let element: Element
    
    enum Element: String {
        case Fire
        case Grass
        case Water
        case All
    }
    
    init(name: String, element: Element) {
        self.name = name
        self.image = UIImage(named: name)
        self.element = element
        super.init()
    }
    
}
