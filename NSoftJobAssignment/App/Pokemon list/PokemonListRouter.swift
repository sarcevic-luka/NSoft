//
//  PokemonListRouter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 31.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Model

protocol PokemonListRoutingLogic: AnyObject {
  func showFavouritesList()
  func showDetails(for pokemonId: Int)
}

protocol PokemonListRouterDelegate: AnyObject { }

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
extension PokemonListRouter: PokemonListRoutingLogic {
  func showFavouritesList() {
    #warning("Implement")
  }
  
  func showDetails(for pokemonId: Int) {
    let pokemonDetailsScene = PokemonDetailsRouter.createModule(pokemonId: pokemonId, delegate: self)
    viewController?.navigationController?.pushViewController(pokemonDetailsScene, animated: true)
  }
}

extension PokemonListRouter: PokemonDetailsRouterDelegate { }
