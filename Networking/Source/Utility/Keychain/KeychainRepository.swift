//
//  KeychainRepository.swift
//  Networking
//
//  Created by Luka Šarčević on 29.08.2021..
//

import Foundation

public struct KeychainRepository {
  enum Key: String, CaseIterable {
    case username
  }
  
  public static let keychain = Keychain(name: keychainName)
  private static var keychainName: String {
    let keywords = [Bundle.main.bundleIdentifier, "pokemon-keychain-repository"]
    return keywords.compactMap { $0 }.joined(separator: ".")
  }
}

// MARK: - Functions
public extension KeychainRepository {
  static func remove(for key: Keychain.Key) {
    keychain.remove(for: key)
  }
  
  static func removeAll() {
    Keychain.Key.allCases.forEach { Self.remove(for: $0) }
  }
}

// MARK: - Values
public extension KeychainRepository {
  static var username: String? {
    get { UserDefaults.standard.string(forKey: .username) }
    set { UserDefaults.standard.setValue(newValue, forKey: .username) }
  }
}

internal extension Keychain.Key {
  static let username = "username"
  
  static var allCases: [Keychain.Key] {
    [.username]
  }
}
