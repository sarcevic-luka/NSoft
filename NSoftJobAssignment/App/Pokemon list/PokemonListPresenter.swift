//
//  PokemonListPresenter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 31.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol PokemonListViewPresentingLogic: AnyObject {
  func onFavouritesSelected()
  func onPrefetchRequested()
  func onItemSelected(at indexPath: IndexPath)
  func onViewDidAppeared()

}

class PokemonListPresenter {
  var interactor: PokemonListBusinessLogic?
  weak private var view: PokemonListDisplayLogic?
  private var dataSource: PokemonListDataSource?
  private var isFetchInProgress = false
  private let router: PokemonListRoutingLogic
  
  init(interface: PokemonListDisplayLogic, interactor: PokemonListBusinessLogic?, router: PokemonListRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - PokemonListViewPresentingLogic
extension PokemonListPresenter: PokemonListViewPresentingLogic {
  func onPrefetchRequested() {
    #warning("Logic here")
  }
  
  func onFavouritesSelected() {
    router.showFavouritesList()
  }
  
  func onItemSelected(at indexPath: IndexPath) {
    guard let pokemonItem = dataSource?.pokemonItem(at: indexPath) else {
      return
    }
    router.showDetails(pokemon: pokemonItem)
  }
  
  func onViewDidAppeared() {
    getAndSetPokemonsList()
  }
}

// MARK: - Private methods
private extension PokemonListPresenter {
  func getAndSetPokemonsList() {
    if isFetchInProgress { return }
    isFetchInProgress = true
    interactor?.getPokemonsList(offset: dataSource?.currentOffset() ?? 0, limit: 50)
      .then { [weak self] pokemonList in
        guard let strongSelf = self else { return }
        guard let dataSource = strongSelf.dataSource else {
          strongSelf.dataSource = PokemonListDataSource(pokemonList: pokemonList)
          strongSelf.view?.displayPokemonList(using: pokemonList)
          return
        }
        dataSource.setPokemons(pokemonList)
        strongSelf.view?.displayPokemonList(using: pokemonList)
      }
      .always { [weak self] in
        self?.isFetchInProgress = false
      }
  }
}
