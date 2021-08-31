//
//  PokemonList.swift
//  Model
//
//  Created by Luka Šarčević on 28.08.2021..
//

import Foundation

public struct PokemonList {
  public let count: Int
  public var next: String?
  public var previous: String?
  public var results: [PokemonListResultItem]
}

extension PokemonList: Codable { }
