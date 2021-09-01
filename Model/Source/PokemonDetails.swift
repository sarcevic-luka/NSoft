//
//  PokemonDetails.swift
//  Model
//
//  Created by Luka Šarčević on 29.08.2021..
//

import Foundation

public struct PokemonDetails {
  public let id: Int
  public let name: String
  public let baseExperience: Int
  public let weight: Int
  public let types: [PokemonTypeListItem]
  public let typesJoinedInString: String?

  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case baseExperience = "base_experience"
    case weight
    case types
    case typesJoinedInString
  }
  
  public init(pokemonId: Int, name: String, baseExperience: Int, weight: Int, typesJoinedInString: String?) {
    self.id = pokemonId
    self.name = name
    self.baseExperience = baseExperience
    self.weight = weight
    self.types = []
    self.typesJoinedInString = typesJoinedInString
  }
}


extension PokemonDetails: Codable { }
