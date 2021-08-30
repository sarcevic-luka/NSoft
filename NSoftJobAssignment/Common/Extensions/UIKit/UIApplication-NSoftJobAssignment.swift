//
//  UIApplication-NSoftJobAssignment.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 30.08.2021..
//

import UIKit

extension UIApplication {
  static var app: AppDelegate {
    shared.delegate as! AppDelegate
  }
  static var router: AppRouter { app.appRouter }
  var focusedWindow: UIWindow? { Self.shared.windows.first(where: { $0.isKeyWindow }) }
}
