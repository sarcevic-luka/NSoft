//
//  UIBarButtonItem-NSoftJobAssignment.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 31.08.2021..
//

import UIKit

extension UIBarButtonItem {
  static func favourites(target: Any, action: Selector) -> UIBarButtonItem {
    let logoutBarButton = UIBarButtonItem(title: "Favourites",
                                          style: .done,
                                          target: target,
                                          action: action)
    logoutBarButton.setTitleTextAttributes([
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .medium),
      NSAttributedString.Key.foregroundColor: UIColor.white
    ], for: .normal)
    return logoutBarButton
  }
}
