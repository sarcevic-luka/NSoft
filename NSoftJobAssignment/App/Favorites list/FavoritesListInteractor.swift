//
//  FavoritesListInteractor.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Model
import Persistence
import Promises

protocol FavoritesListBusinessLogic: AnyObject {
  func getFavoritesList() -> Promise<[PokemonDetails]>
}

class FavoritesListInteractor {
  private let favoritesPokemonPersistanceService: FavoritesPokemonPersistanceServiceProtocol

  init(favoritesPokemonPersistanceService: FavoritesPokemonPersistanceServiceProtocol = FavoritesPokemonPersistanceService()
  ) {
    self.favoritesPokemonPersistanceService = favoritesPokemonPersistanceService
  }
}

// MARK: - FavoritesListBusinessLogic
extension FavoritesListInteractor: FavoritesListBusinessLogic {
  func getFavoritesList() -> Promise<[PokemonDetails]> {
    favoritesPokemonPersistanceService.getFavoritePokemons()
  }
}
