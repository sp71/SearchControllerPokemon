//
//  ViewController.swift
//  SearchControllerPokemon
//
//  Created by Satinder Singh on 7/4/16.
//  Copyright © 2016 Satinder. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let reuseCellIdentifier = "reuseCellIdentifier"
    private let pokemonList = PokemonDataSource.createList()
    private let searchController = UISearchController(searchResultsController: nil)
    private var filteredPokemonList = [Pokemon]()
    @IBOutlet weak var tableView: UITableView!


    override func viewDidLoad() {
        super.viewDidLoad()
        configureSearchController()
    }
    
    func configureSearchController() {
        searchController.searchResultsUpdater = self
        searchController.dimsBackgroundDuringPresentation = false
        definesPresentationContext = true
        tableView.tableHeaderView = searchController.searchBar
        searchController.searchBar.scopeButtonTitles = ["All", "Grass", "Fire", "Water"]
        searchController.searchBar.delegate = self
    }
    
    func filterSearchController(searchBar: UISearchBar) {
        guard let scopeString = searchBar.scopeButtonTitles?[searchBar.selectedScopeButtonIndex] else { return }
        let selectedElement = Pokemon.Element(rawValue: scopeString) ?? .All
        let searchText = searchBar.text ?? ""
        
        // filter pokemonList by element and text
        filteredPokemonList = pokemonList.filter { pokemon in
            let isElementMatching = (selectedElement == .All) || (pokemon.element == selectedElement)
            let isMatchingSearchText = pokemon.name.lowercaseString.containsString(searchText.lowercaseString) || searchText.lowercaseString.characters.count == 0
            return isElementMatching && isMatchingSearchText
        }
        
        tableView.reloadData()
    }

}

extension ViewController : UITableViewDataSource {

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(reuseCellIdentifier, forIndexPath: indexPath)
        let pokemon = searchController.active ? filteredPokemonList[indexPath.row] : pokemonList[indexPath.row]
        cell.textLabel!.text = pokemon.name
        cell.detailTextLabel?.text = pokemon.element.rawValue
        cell.imageView!.image = pokemon.image
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchController.active ? filteredPokemonList.count : pokemonList.count
    }

}

extension ViewController : UISearchResultsUpdating {
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
         filterSearchController(searchController.searchBar)
    }
    
}

extension ViewController : UISearchBarDelegate {
    
    func searchBar(searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterSearchController(searchBar)
    }
    
}

