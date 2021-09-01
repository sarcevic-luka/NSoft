//
//  PokemonDetailsInteractor.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Networking
import Model
import Promises

protocol PokemonDetailsBusinessLogic: AnyObject {
  func getPokemonsDetails(for pokemonId: Int) -> Promise<PokemonDetails>
}

class PokemonDetailsInteractor {
  private let pokemonListNetworkService: PokemonListNetworkServiceProtocol

  init(pokemonListNetworkService: PokemonListNetworkServiceProtocol = PokemonListNetworkService()) {
    self.pokemonListNetworkService = pokemonListNetworkService
  }
}

// MARK: - PokemonDetailsBusinessLogic
extension PokemonDetailsInteractor: PokemonDetailsBusinessLogic {
  func getPokemonsDetails(for pokemonId: Int) -> Promise<PokemonDetails> {
    pokemonListNetworkService.getPokemonDetails(for: pokemonId)
  }
}
