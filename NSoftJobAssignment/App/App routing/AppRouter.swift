//
//  AppRouter.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 30.08.2021..
//

import UIKit
import Networking

protocol AppRoutingLogic { }

// MARK: AppRouter
final class AppRouter {
  private let appData: AppDataProtocol

  init(appData: AppDataProtocol = AppData()) {
    self.appData = appData
  }
}

// MARK: Routing
extension AppRouter: Router, AppRoutingLogic {
  var viewController: UIViewController? {
    UIApplication.shared.focusedWindow?.topViewController
  }
}

extension AppRouter {
  func initialViewController() -> UIViewController {
    #warning("After adding list - update this")
    return  SignInRouter.createModule(delegate: nil)
//   appData. KeychainRepository.userSignedIn == nil ? UINavigationController(rootViewController: UserAccessRouter.createModule(delegate: nil)) : PokemonListRouter.createModule(delegate: nil)
  }
}
