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
  private(set) lazy var appRouter = AppRouter()
}

extension AppDelegate: UIApplicationDelegate {
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    
    StartupProcessService()
      .execute(process: AppearanceCustomisationStartupProcess())

    window?.rootViewController = appRouter.initialViewController()
    window?.makeKeyAndVisible()
    
    return true
  }
}

