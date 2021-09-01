//
//  PokemonTypeListItem.swift
//  Model
//
//  Created by Luka Šarčević on 29.08.2021..
//

import Foundation

public struct PokemonTypeListItem {
  public let slot: Int
  public let type: PokemonListResultItem
}
 
extension PokemonTypeListItem: Codable { }
