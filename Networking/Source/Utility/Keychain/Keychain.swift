//
//  Keychain.swift
//  Networking
//
//  Created by Luka Šarčević on 29.08.2021..
//

import Foundation
import KeychainAccess

public struct Keychain {
  public typealias Key = String
  private let keychain: KeychainAccess.Keychain
  
  internal init(name: String) {
    self.keychain = KeychainAccess.Keychain(service: name)
  }
}

public extension Keychain {
  func string(for key: Key) -> String? {
    return keychain[string: key]
  }
  
  func decodable<T: Decodable>(for key: Key) -> T? {
    guard let data = keychain[data: key] else {
      return nil
    }
    return try? JSONDecoder.default.decode(T.self, from: data)
  }
  
  func setEncodable<T: Encodable>(_ encodable: T, for key: Key) {
    let encodedData = try? JSONEncoder.default.encode(encodable)
    keychain[data: key] = encodedData
  }
  
  func set(_ string: String?, for key: Key) {
    keychain[key] = string
  }
  
  func remove(for key: Key) {
    keychain[key] = nil
  }
}
