//
//  PokemonList.swift
//  Model
//
//  Created by Luka Šarčević on 28.08.2021..
//

import Foundation

public struct PokemonList {
  public let count: Int
  public let next: String?
  public let previous: String?
  public let results: [PokemonListResultItem]
}

extension PokemonList: Codable { }
