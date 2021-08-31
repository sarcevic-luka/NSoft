//
//  PokemonListRouter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 31.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonListRoutingLogic: class { }

protocol PokemonListRouterDelegate: class { }

class PokemonListRouter {
  weak var viewController: PokemonListViewController?
  weak var delegate: PokemonListRouterDelegate?
  
  static func createModule(delegate: PokemonListRouterDelegate?) -> PokemonListViewController {
    let view = PokemonListViewController(nibName: nil, bundle: nil)
    let interactor = PokemonListInteractor()
    let router = PokemonListRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = PokemonListPresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - PokemonListRoutingLogic
extension PokemonListRouter: PokemonListRoutingLogic { }
