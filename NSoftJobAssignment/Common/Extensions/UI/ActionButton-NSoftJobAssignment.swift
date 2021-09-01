//
//  ActionButton-NSoftJobAssignment.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 31.08.2021..
//

import Foundation
import Assets

extension ActionButton {
  static func close(target: Any, selector: Selector) -> Self {
    let actionButton = Self(type: .custom)
    actionButton.setImage(ImageAssets.Icons.close.image, for: .normal)
    actionButton.style = .disabled
    actionButton.addTarget(target, action: selector, for: .touchUpInside)
    return actionButton
  }
  
  static func continueLogin(target: Any, selector: Selector) -> Self {
    let actionButton = Self(type: .custom)
    actionButton.isEnabled = false
    actionButton.setTitle("Continue".uppercased(), for: .normal)
    actionButton.style = .disabled
    actionButton.addTarget(target, action: selector, for: .touchUpInside)
    return actionButton
  }
  
  static func favorites(target: Any, selector: Selector) -> Self {
    let actionButton = Self(type: .custom)
    actionButton.setTitle("Remove from favorites", for: .application)
    actionButton.style = .default
    actionButton.addTarget(target, action: selector, for: .touchUpInside)
    return actionButton
  }
}
