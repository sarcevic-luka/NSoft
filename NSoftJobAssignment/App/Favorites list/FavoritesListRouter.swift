//
//  FavoritesListRouter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol FavoritesListRoutingLogic: AnyObject {
  func dismiss()
  func showDetails(for pokemonId: Int)
}

protocol FavoritesListRouterDelegate: AnyObject {
  func favoritesListRouterRequestedDismissal()
}

class FavoritesListRouter {
  weak var viewController: FavoritesListViewController?
  weak var delegate: FavoritesListRouterDelegate?
  
  static func createModule(delegate: FavoritesListRouterDelegate?) -> FavoritesListViewController {
    let view = FavoritesListViewController(nibName: nil, bundle: nil)
    let interactor = FavoritesListInteractor()
    let router = FavoritesListRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = FavoritesListPresenter(interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - FavoritesListRoutingLogic
extension FavoritesListRouter: FavoritesListRoutingLogic {
  func showDetails(for pokemonId: Int) {
    let pokemonDetailsScene = PokemonDetailsRouter.createModule(pokemonId: pokemonId, delegate: self)
    viewController?.navigationController?.pushViewController(pokemonDetailsScene, animated: true)
  }
  
  func dismiss() {
    delegate?.favoritesListRouterRequestedDismissal()
  }
}

extension FavoritesListRouter: PokemonDetailsRouterDelegate {
  func pokemonDetailsRouterRequestedDismissal() {
    viewController?.navigationController?.popViewController(animated: true)
  }
}
