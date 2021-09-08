//
//  UITableView-NSoftJobAssignment.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 01.09.2021..
//

import UIKit
import Assets

public extension UITableView {
  func register<T: UITableViewCell>(_: T.Type) {
    register(T.self, forCellReuseIdentifier: T.identifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(forIndexPath indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
      fatalError("Could not dequeue cell with identifier: \(T.identifier)")
    }
    return cell
  }
  
  func dequeueReusableCell<T: UITableViewCell>(_ cell: T.Type, at indexPath: IndexPath) -> T {
    guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
      debugPrint("Could not dequeue cell with identifier: \(T.identifier). Creating new instance.")
      return T()
    }
    return cell
  }
}

extension UITableView {
  func setEmptyMessage(_ message: String) {
    let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
    messageLabel.text = message
    messageLabel.textColor = ColorAssets.General.pokeRed.color
    messageLabel.numberOfLines = 0
    messageLabel.textAlignment = .center
    messageLabel.font = .systemFont(ofSize: 24, weight: .medium)
    messageLabel.sizeToFit()
    
    self.backgroundView = messageLabel
    self.separatorStyle = .none
  }
  
  func restore() {
    self.backgroundView = nil
  }
}

public extension UITableViewCell {
  /// Returns cell's reuse identifier
  static var identifier: String {
    return String(describing: self)
  }
}
