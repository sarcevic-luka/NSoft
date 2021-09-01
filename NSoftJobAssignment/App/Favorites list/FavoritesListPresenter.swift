//
//  FavoritesListPresenter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol FavoritesListViewPresentingLogic: AnyObject {
  func onViewWillAppear()
  func onBackBarButtonItemTapped()
  func onItemSelected(at indexPath: IndexPath)
  func onItemDeleted(at indexPath: IndexPath)
}

class FavoritesListPresenter {
  var interactor: FavoritesListBusinessLogic?
  weak private var view: FavoritesListDisplayLogic?
  private var dataSource: FavoritesListDataSource?
  private let router: FavoritesListRoutingLogic
  
  init(interface: FavoritesListDisplayLogic, interactor: FavoritesListBusinessLogic?, router: FavoritesListRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - FavoritesListViewPresentingLogic
extension FavoritesListPresenter: FavoritesListViewPresentingLogic {
  func onItemSelected(at indexPath: IndexPath) {
    guard let pokemonItem = dataSource?.pokemonItem(at: indexPath) else {
      return
    }
    router.showDetails(for: pokemonItem.id)
  }
  
  func onItemDeleted(at indexPath: IndexPath) {
    guard let pokemonItem = dataSource?.pokemonItem(at: indexPath) else {
      return
    }
    interactor?.removePokemonFromFavorites(for: pokemonItem)
      .then { [weak self] _ in
        self?.loadFavoritesList()
      }
  }

  func onViewWillAppear() {
    loadFavoritesList()
  }
  
  func onBackBarButtonItemTapped() {
    router.dismiss()
  }
}

private extension FavoritesListPresenter {
  func loadFavoritesList() {
    interactor?.getFavoritesList()
      .then { [weak self] favoriteList in
        self?.dataSource = FavoritesListDataSource(favoritesList: favoriteList)
        self?.view?.displayFavorites(using: FavoritesListDataSource(favoritesList: favoriteList))
      }
  }
}
