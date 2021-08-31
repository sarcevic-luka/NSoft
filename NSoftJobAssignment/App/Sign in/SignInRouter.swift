//
//  SignInRouter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 30.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignInRoutingLogic: AnyObject {
  func showPokemonList()
}

protocol SignInRouterDelegate: AnyObject { }

class SignInRouter {
  weak var viewController: SignInViewController?
  weak var delegate: SignInRouterDelegate?
  
  static func createModule(delegate: SignInRouterDelegate?) -> SignInViewController {
    let view = SignInViewController(nibName: nil, bundle: nil)
    let interactor = SignInInteractor()
    let router = SignInRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = SignInPresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - SignInRoutingLogic
extension SignInRouter: SignInRoutingLogic {
  func showPokemonList() {
    #warning("Add Pokemon list scene here")
  }
}
