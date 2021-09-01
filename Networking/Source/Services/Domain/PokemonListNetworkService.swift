//
//  PokemonListNetworkService.swift
//  Networking
//
//  Created by Luka Šarčević on 29.08.2021..
//

import Foundation
import Model
import Promises
import Alamofire

public protocol PokemonListNetworkServiceProtocol {
  func getPokemonList(offset: Int, limit: Int) -> Promise<PokemonList>
  func getPokemonDetails(for pokemonId: Int) -> Promise<PokemonDetails>
}

public final class PokemonListNetworkService {
  public init() { }
}

extension PokemonListNetworkService: PokemonListNetworkServiceProtocol {
  public func getPokemonList(offset: Int, limit: Int) -> Promise<PokemonList> {
    Promise { fullfill, reject in
      Networking.session
        .request(resource: PokemonListResource.getPokemonsList(offset: offset, limit: limit))
        .validate()
        .responseDecodable(decoder: JSONDecoder.default) { (response: DataResponse<PokemonList, AFError>) in
          switch response.result {
          case .success(let data):
            fullfill(data)
          case .failure(let error):
            reject(error)
          }
        }
    }
  }
  
  public func getPokemonDetails(for pokemonId: Int) -> Promise<PokemonDetails> {
    Promise { fullfill, reject in
      Networking.session
        .request(resource: PokemonListResource.getPokemonDetails(pokemonId: pokemonId))
        .validate()
        .responseDecodable(decoder: JSONDecoder.default) { (response: DataResponse<PokemonDetails, AFError>) in
          switch response.result {
          case .success(let data):
            fullfill(data)
          case .failure(let error):
            reject(error)
          }
        }
    }
  }
}
