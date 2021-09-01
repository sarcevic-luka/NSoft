//
//  ReusableView.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 31.08.2021..
//

import UIKit

public protocol ReusableView {
  static var defaultReuseIdentifier: String { get }
}

public extension ReusableView {
  static var defaultReuseIdentifier: String {
    return String(describing: self)
  }
}

extension UIView: ReusableView { }

