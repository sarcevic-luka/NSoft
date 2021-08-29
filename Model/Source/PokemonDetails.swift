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
  
  private enum CodingKeys: String, CodingKey {
    case id
    case name
    case baseExperience = "base_experience"
    case weight
    case types
  }
}

extension PokemonDetails: Codable { }
