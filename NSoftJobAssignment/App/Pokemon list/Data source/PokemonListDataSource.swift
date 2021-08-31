//
//  PokemonListDataSource.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 31.08.2021..
//

import Foundation
import Model

enum PokemonListDataSourceItem {
  case pokemonItem(PokemonListCell.ViewModel)
}

enum PokemonListDataSourceSection: SectionProtocol {
  case pokemonsList([PokemonListDataSourceItem])
  
  var items: [PokemonListDataSourceItem] {
    switch self {
    case .pokemonsList(let items):
      return items
    }
  }
}

class PokemonListDataSource: DataSourceProtocol {
  var pokemonList: PokemonList
  private(set) lazy var sections = [PokemonListDataSourceSection]()
  
  init(pokemonList: PokemonList) {
    self.pokemonList = pokemonList
    buildSections()
  }
}

extension PokemonListDataSource {
  func setPokemons(_ newPokemonBatch: PokemonList) {
    pokemonList.next = newPokemonBatch.next
    pokemonList.previous = newPokemonBatch.previous
    pokemonList.results.append(contentsOf: newPokemonBatch.results)
    buildSections()
  }
  
  func pokemonItem(at indexPath: IndexPath) -> PokemonListResultItem? {
    return pokemonList.results[safe: indexPath.item]
  }
  
  func calculateIndexPathsToReload(from newResults: [PokemonListResultItem]) -> [IndexPath] {
    let startIndex = currentOffset() - newResults.count
    let endIndex = startIndex + newResults.count
    return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
  }
  
  func currentOffset() -> Int {
    pokemonList.results.count
  }
}

private extension PokemonListDataSource {
  func buildSections() {
    sections.removeAll()
    if let appointmentsList = createMedicationsSection() {
      sections.append(appointmentsList)
    }
  }
  
  func createMedicationsSection() -> PokemonListDataSourceSection? {
    let items = pokemonList.results.map { PokemonListDataSourceItem.pokemonItem(PokemonListCell.ViewModel(name: $0.name.capitalizingFirstLetter())) }
    return .pokemonsList(items)
  }
}
