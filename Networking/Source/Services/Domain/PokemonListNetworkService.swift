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
  func getPokemonList() -> Promise<PokemonList>
}

public final class PokemonListNetworkService {
  public init() { }
}

extension PokemonListNetworkService: PokemonListNetworkServiceProtocol {
  public func getPokemonList() -> Promise<PokemonList> {
    Promise { fullfill, reject in
      Networking.userSession
        .request(resource: PokemonListResource.getPokemonsList)
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
}
