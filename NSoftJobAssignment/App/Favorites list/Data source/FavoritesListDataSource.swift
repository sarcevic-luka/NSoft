//
//  FavoritesListDataSource.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 01.09.2021..
//

import Foundation
import Model

enum FavoritesListDataSourceItem {
  case pokemonItem(FavoritesListCell.ViewModel)
}

enum FavoritesListDataSourceSection: SectionProtocol {
  case favoritesList([FavoritesListDataSourceItem])
  
  var items: [FavoritesListDataSourceItem] {
    switch self {
    case .favoritesList(let items):
      return items
    }
  }
}

class FavoritesListDataSource: DataSourceProtocol {
  var favoritesList: [PokemonDetails]
  private(set) lazy var sections = [FavoritesListDataSourceSection]()
  
  init(favoritesList: [PokemonDetails]) {
    self.favoritesList = favoritesList
    buildSections()
  }
}

extension FavoritesListDataSource {
  func pokemonItem(at indexPath: IndexPath) -> PokemonDetails? {
    return favoritesList[safe: indexPath.item]
  }
}

private extension FavoritesListDataSource {
  func buildSections() {
    sections.removeAll()
    if let favoritesList = createFavoritesSection() {
      sections.append(favoritesList)
    }
  }
  
  func createFavoritesSection() -> FavoritesListDataSourceSection? {
    let items = favoritesList.map { FavoritesListDataSourceItem.pokemonItem(
      FavoritesListCell.ViewModel(name: $0.name, imageId: $0.id, types: $0.typesJoinedInString ?? "")) }
    return .favoritesList(items)
  }
}
