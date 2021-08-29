//
//  PokemonListResource.swift
//  Networking
//
//  Created by Luka Šarčević on 29.08.2021..
//

import Foundation
import Alamofire

public enum PokemonListResource: Resource {
  case getPokemonsList
  // Acutal Appointmen details controller
  case getPokemonDetails(pokemonId: Int)
  
  var endpoint: String {
    switch self {
    case .getPokemonsList:
      return ""
    case .getPokemonDetails(let pokemonId):
      return "/\(pokemonId)"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .getPokemonsList, .getPokemonDetails:
      return .get
    }
  }
}
