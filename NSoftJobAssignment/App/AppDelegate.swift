//
//  AppDelegate.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 27.08.2021..
//

import UIKit

@UIApplicationMain
  class AppDelegate: UIResponder {
  var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
}

extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
//    window?.rootViewController = appRouter.initialViewController()
    window?.makeKeyAndVisible()

    return true
  }
}

