//
//  Host.swift
//  Networking
//
//  Created by Luka Šarčević on 29.08.2021..
//

import Foundation

enum Host: String {
  case dev = "https://pokeapi.co/api/v2/pokemon"
}

extension Host {
  var endpoint: URL {
    URL(string: self.rawValue)!
  }
}
