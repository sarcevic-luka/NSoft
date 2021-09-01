//
//  PokemonListResultItem.swift
//  Model
//
//  Created by Luka Šarčević on 28.08.2021..
//

import Foundation

public struct PokemonListResultItem {
  public let name: String
  public let url: URL
}
 
extension PokemonListResultItem: Codable { }
