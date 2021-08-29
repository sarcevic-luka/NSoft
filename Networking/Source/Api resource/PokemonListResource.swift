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
      return "private/appointment/list"
    case .getPokemonDetails(let pokemonId):
      return "private/appointment/\(appointmentId)"
    }
  }
  
  var method: HTTPMethod {
    switch self {
    case .getActualAppointmentsList, .getPokemonDetails:
      return .get
    }
  }
}
