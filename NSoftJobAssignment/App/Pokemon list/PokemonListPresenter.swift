//
//  PokemonListPresenter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 31.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol PokemonListViewPresentingLogic: class { }

class PokemonListPresenter {
  var interactor: PokemonListBusinessLogic?
  weak private var view: PokemonListDisplayLogic?
  private let router: PokemonListRoutingLogic
  
  init(interface: PokemonListDisplayLogic, interactor: PokemonListBusinessLogic?, router: PokemonListRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - PokemonListViewPresentingLogic
extension PokemonListPresenter: PokemonListViewPresentingLogic { }
