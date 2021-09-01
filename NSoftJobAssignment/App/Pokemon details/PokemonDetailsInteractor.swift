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
import Persistence
import Promises

protocol PokemonDetailsBusinessLogic: AnyObject {
  func getPokemonsDetails(for pokemonId: Int) -> Promise<PokemonDetails>
  func addOrRemovePokemonFromFavorites(for pokemonDetails: PokemonDetails) -> Promise<Void>
  func isPokemonFavourite(for pokemonId: Int) -> Promise<Bool>
}

class PokemonDetailsInteractor {
  private let pokemonListNetworkService: PokemonListNetworkServiceProtocol
  private let favoritesPokemonPersistanceService: FavoritesPokemonPersistanceServiceProtocol

  init(pokemonListNetworkService: PokemonListNetworkServiceProtocol = PokemonListNetworkService(),
       favoritesPokemonPersistanceService: FavoritesPokemonPersistanceServiceProtocol = FavoritesPokemonPersistanceService()
  ) {
    self.pokemonListNetworkService = pokemonListNetworkService
    self.favoritesPokemonPersistanceService = favoritesPokemonPersistanceService
  }
}

// MARK: - PokemonDetailsBusinessLogic
extension PokemonDetailsInteractor: PokemonDetailsBusinessLogic {
  func addOrRemovePokemonFromFavorites(for pokemonDetails: PokemonDetails) -> Promise<Void> {
    favoritesPokemonPersistanceService.addOrRemoveToFavorites(pokemonDetails: pokemonDetails)
  }
  
  func isPokemonFavourite(for pokemonId: Int) -> Promise<Bool> {
    favoritesPokemonPersistanceService.pokemonIsInFavorites(pokemonId: pokemonId)
  }
  
  func getPokemonsDetails(for pokemonId: Int) -> Promise<PokemonDetails> {
    pokemonListNetworkService.getPokemonDetails(for: pokemonId)
  }
}
