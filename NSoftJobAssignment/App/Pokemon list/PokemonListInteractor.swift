//
//  PokemonListInteractor.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 31.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Networking
import Model
import Promises

protocol PokemonListBusinessLogic: AnyObject {
  func getPokemonsList(offset: Int, limit: Int) -> Promise<PokemonList>
}

class PokemonListInteractor {
  private let pokemonListNetworkService: PokemonListNetworkServiceProtocol

  init(pokemonListNetworkService: PokemonListNetworkServiceProtocol = PokemonListNetworkService()) {
    self.pokemonListNetworkService = pokemonListNetworkService
  }
}

// MARK: - PokemonListBusinessLogic
extension PokemonListInteractor: PokemonListBusinessLogic {
  func getPokemonsList(offset: Int, limit: Int) -> Promise<PokemonList> {
    pokemonListNetworkService.getPokemonList(offset: offset, limit: limit)
  }
}
