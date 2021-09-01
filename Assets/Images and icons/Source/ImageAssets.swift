//
//  ImageAssets.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 31.08.2021..
//

import Foundation

public struct ImageAssets { }

public extension ImageAssets {
  enum Icons: String, ImageAsset {
    case back = "icn_back"
    case error = "icn_poke_error"
    case warning = "icn_poke_warning"
    case pokeball = "icn_pokeball"
  }
}
