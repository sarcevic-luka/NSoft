//
//  PokemonDetailsRouter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonDetailsRoutingLogic: AnyObject { }

protocol PokemonDetailsRouterDelegate: AnyObject { }

class PokemonDetailsRouter {
  weak var viewController: PokemonDetailsViewController?
  weak var delegate: PokemonDetailsRouterDelegate?
  
  static func createModule(pokemonId: Int ,delegate: PokemonDetailsRouterDelegate?) -> PokemonDetailsViewController {
    let view = PokemonDetailsViewController(nibName: nil, bundle: nil)
    let interactor = PokemonDetailsInteractor()
    let router = PokemonDetailsRouter()
    router.delegate = delegate
    router.viewController = view
    let presenter = PokemonDetailsPresenter(pokemonId: pokemonId, interface: view, interactor: interactor, router: router)
    view.presenter = presenter
    return view
  }
}

// MARK: - PokemonDetailsRoutingLogic
extension PokemonDetailsRouter: PokemonDetailsRoutingLogic { }
