//
//  PokemonViewCell.swift
//  PokemonApp
//
//  Created by Andrey Kovalev on 15.11.2023.
//

import UIKit

class PokemonViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet var pokemonImageView: UIImageView!
    
    func configur(pokemon: Pokemon) {
        nameLabel.text = pokemon.name
        NetworkManager.shared.fetch(dataType: Character.self, url: pokemon.url) {character in
            NetworkManager.shared.fetchImage(from: character.sprites.other.home.front_default) { data in
                self.pokemonImageView.image = UIImage(data: data)
            }
        }
    }
}
