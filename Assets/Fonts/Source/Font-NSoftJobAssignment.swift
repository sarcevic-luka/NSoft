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
    return UIFont(name: "Pokemon\(weight.rawValue)Normal", size: size) ?? UIFont.systemFont(ofSize: 14)
  }
    
  enum FontWeight: String, CaseIterable {
    case hollow = "Hollow"
    case solid = "Solid"
  }
}
