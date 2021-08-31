//
//  ColorAssets.swift
//  Assets
//
//  Created by Luka Šarčević on 31.08.2021..
//

import UIKit

public struct ColorAssets { }

public extension ColorAssets {
  enum General: String, ColorAsset {
    case pokeBlue = "color_poke_blue"
    case pokeGreen = "color_poke_green"
    case pokeLightGray = "color_poke_gray"
    case pokeRed = "color_poke_red"

    public var color: UIColor {
      UIColor(named: rawValue, in: Bundle(for: ColorDummy.self), compatibleWith: nil) ?? .black
    }
  }
}
