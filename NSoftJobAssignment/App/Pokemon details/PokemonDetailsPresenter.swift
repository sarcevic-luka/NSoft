//
//  PokemonDetailsPresenter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol PokemonDetailsViewPresentingLogic: AnyObject {
  func onViewWillAppear()
}

class PokemonDetailsPresenter {
  var interactor: PokemonDetailsBusinessLogic?
  weak private var view: PokemonDetailsDisplayLogic?
  private let pokemonId: Int
  private let router: PokemonDetailsRoutingLogic
  
  init(pokemonId: Int, interface: PokemonDetailsDisplayLogic, interactor: PokemonDetailsBusinessLogic?, router: PokemonDetailsRoutingLogic) {
    self.view = interface
    self.pokemonId = pokemonId
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - PokemonDetailsViewPresentingLogic
extension PokemonDetailsPresenter: PokemonDetailsViewPresentingLogic {
  func onViewWillAppear() {
    getAndSetPokemonDetails()
  }
}

// MARK: - Private methods
private extension PokemonDetailsPresenter {
  func getAndSetPokemonDetails() {
    interactor?.getPokemonsDetails(for: pokemonId)
      .then { [weak self] pokemonDetails in
        self?.view?.display(pokemonDetails: pokemonDetails)
      }
      .catch { errpr in
        print(errpr)
      }
  }
}

