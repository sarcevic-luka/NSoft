//
//  PokemonDetailsPresenter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Model

protocol PokemonDetailsViewPresentingLogic: AnyObject {
  func onViewWillAppear()
  func onBackBarButtonItemTapped()
  func onFavoritesButtonTapped()
}

class PokemonDetailsPresenter {
  var interactor: PokemonDetailsBusinessLogic?
  weak private var view: PokemonDetailsDisplayLogic?
  private var pokemonDetails: PokemonDetails?
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
    getPokemonFavoriteStatus()
    getAndSetPokemonDetails()
  }
  
  func onBackBarButtonItemTapped() {
    router.dismiss()
  }
  
  func onFavoritesButtonTapped() {
    guard let details = pokemonDetails else {
      return
    }
    interactor?.addOrRemovePokemonFromFavorites(for: details)
      .then { [weak self] in
        self?.getPokemonFavoriteStatus()
      }
  }
}

// MARK: - Private methods
private extension PokemonDetailsPresenter {
  func getAndSetPokemonDetails() {
    interactor?.getPokemonsDetails(for: pokemonId)
      .then { [weak self] pokemonDetails in
        self?.pokemonDetails = pokemonDetails
        self?.view?.display(pokemonDetails: pokemonDetails)
      }
      .catch { error in
        debugPrint(error)
      }
  }
  
  func getPokemonFavoriteStatus() {
    interactor?.isPokemonFavourite(for: pokemonId)
      .then { [weak self] isFavorite in
        self?.view?.displayButton(isFavorite: isFavorite)
      }
  }
}
