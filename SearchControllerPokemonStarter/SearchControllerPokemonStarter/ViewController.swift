//
//  ViewController.swift
//  SearchControllerPokemonStarter
//
//  Created by Satinder Singh on 7/4/16.
//  Copyright © 2016 Satinder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let reuseCellIdentifier = "reuseCellIdentifier"
    private let pokemonList = PokemonDataSource.createList()
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
    }
    
    func configureSearchController() {
        // TODO
    }
    
}

extension ViewController : UITableViewDataSource {
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseCellIdentifier, forIndexPath: indexPath)
        let pokemon = pokemonList[indexPath.row]
        cell.textLabel!.text = pokemon.name
        cell.detailTextLabel?.text = pokemon.element.rawValue
        cell.imageView!.image = pokemon.image
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonList.count
    }
    
}
