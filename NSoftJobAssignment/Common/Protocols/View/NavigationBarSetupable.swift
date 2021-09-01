//
//  NavigationBarSetupable.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 01.09.2021..
//

import UIKit

protocol NavigationBarSetupable: UIViewController, UIGestureRecognizerDelegate {
  var backButtonTapSelector: Selector { get }
  func setupDefaultBackButtonItem()
}

extension NavigationBarSetupable {
  func setupDefaultBackButtonItem() {
    navigationController?.interactivePopGestureRecognizer?.delegate = self
    navigationItem.leftBarButtonItems = [UIBarButtonItem.back(target: self, action: backButtonTapSelector)]
  }
}
