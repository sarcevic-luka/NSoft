//
//  PokemonDetailsDBO.swift
//  Persistence
//
//  Created by Luka Šarčević on 01.09.2021..
//

import Foundation
import Model
import GRDB

// DB used for saving saved medication periods
public struct PokemonDetailsDBO: FetchableRecord, PersistableRecord {
  public let id: Int
  public let name: String
  public let baseExperience: Int
  public let weight: Int
  public let types: String

  public init(pokemonId: Int,
              name: String,
              baseExperience: Int,
              weight: Int,
              types: String
  ) {
    self.id = pokemonId
    self.name = name
    self.baseExperience = baseExperience
    self.weight = weight
    self.types = types
  }
}

extension PokemonDetailsDBO {
  public init(pokemonDetails: PokemonDetails) {
    self.id = pokemonDetails.id
    self.name = pokemonDetails.name
    self.baseExperience = pokemonDetails.baseExperience
    self.weight = pokemonDetails.weight
    let allTypes = pokemonDetails.types.map { "\($0.type.name)" }
    self.types = allTypes.joined(separator: "/")
  }
}

extension PokemonDetailsDBO: Codable { }
