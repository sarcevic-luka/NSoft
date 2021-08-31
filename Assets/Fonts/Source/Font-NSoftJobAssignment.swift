//
//  Font-NSoftJobAssignment.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 31.08.2021..
//

import Foundation
import UIKit

public extension UIFont {
  static func pokeFont(size: CGFloat, weight: FontWeight) -> UIFont {
    UIFont(name: "poke_\(weight.rawValue)", size: size) ?? UIFont.systemFont(ofSize: 14)
  }
    
  enum FontWeight: String, CaseIterable {
    case hollow = "hollow"
    case solid = "solid"
  }
}
