//
//  ActionButton-NSoftJobAssignment.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 31.08.2021..
//

import Foundation

extension ActionButton {
  static func continueLogin(target: Any, selector: Selector) -> Self {
    let actionButton = Self(type: .custom)
    actionButton.isEnabled = false
    actionButton.setTitle("Continue".uppercased(), for: .normal)
    actionButton.style = .disabled
    actionButton.addTarget(target, action: selector, for: .touchUpInside)
    return actionButton
  }
}
