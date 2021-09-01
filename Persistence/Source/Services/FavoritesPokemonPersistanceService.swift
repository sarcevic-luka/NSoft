//
//  FavoritesPokemonPersistanceService.swift
//  Persistence
//
//  Created by Luka Šarčević on 01.09.2021..
//

import Foundation
import Model
import Promises
import Combine
import GRDB

public protocol FavoritesPokemonPersistanceServiceProtocol {
  func addOrRemoveToFavorites(pokemonDetails: PokemonDetails)
  func getFavoritePokemons() -> Promise<[PokemonDetails]>
  func pokemonIsInFavorites(pokemonId: Int) -> Promise<Bool>
}

public final class FavoritesPokemonPersistanceService {
  public init() { }
}

extension FavoritesPokemonPersistanceService: FavoritesPokemonPersistanceServiceProtocol {
  public func addOrRemoveToFavorites(pokemonDetails: PokemonDetails) {
    pokemonIsInFavorites(pokemonId: pokemonDetails.id)
      .then { [weak self] pokemonIsInFavorites in
        if pokemonIsInFavorites == true {
          self?.removePokemonFromFavorites(pokemonId: pokemonDetails.id)
        } else {
          self?.addPokemonToFavorites(pokemonDetails: pokemonDetails)
        }
      }
  }
  
  public func getFavoritePokemons() -> Promise<[PokemonDetails]> {
    Promise { fullfill, reject in
      try Persistence.dbQueue
        .read { db in
          let favoritesDBO = try PokemonDetailsDBO.fetchAll(db)
          let favorites = favoritesDBO.map { PokemonDetails(pokemonId: $0.id,
                                                            name: $0.name,
                                                            baseExperience: $0.baseExperience,
                                                            weight: $0.weight,
                                                            typesJoinedInString: $0.types)
          }
          fullfill(favorites)
        }
    }
  }
  
  public func pokemonIsInFavorites(pokemonId: Int) -> Promise<Bool> {
    getFavoritePokemons()
      .then { pokemonList in
        return pokemonList.contains { $0.id == pokemonId }
      }
  }
}

private extension FavoritesPokemonPersistanceService {
  func addPokemonToFavorites(pokemonDetails: PokemonDetails)  {
    do {
      try Persistence.dbQueue
        .write { db in
          try PokemonDetailsDBO(pokemonDetails: pokemonDetails).save(db)
        }
    } catch {
      print(error)
    }
  }
  
  func removePokemonFromFavorites(pokemonId: Int) {
    do {
      _ = try Persistence.dbQueue
        .write { db in
          try PokemonDetailsDBO.deleteOne(db, key: pokemonId)
        }
    } catch {
      print(error)
    }
  }
}
