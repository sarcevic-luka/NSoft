//
//  PokemonListViewController.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 31.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Model
import Networking

protocol PokemonListDisplayLogic: AnyObject {
  func displayPokemonList(using pokemonList: PokemonList)
}

class PokemonListViewController: UIViewController {
  var presenter: PokemonListViewPresentingLogic?
  private var dataSource: PokemonListDataSource?
  private lazy var contentView = PokemonListContentView()
  
  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    setupNaviagtionBar()
    presenter?.onViewDidAppeared()
  }
}

// MARK: - PokemonListDisplayLogic
extension PokemonListViewController: PokemonListDisplayLogic {
  func displayPokemonList(using pokemonList: PokemonList) {
    guard let _ = self.dataSource else {
      self.dataSource = PokemonListDataSource(pokemonList: pokemonList)
      self.contentView.collectionView.reloadData()
      return
    }
    self.dataSource?.setPokemons(pokemonList)
    guard let indexPathsForReload = self.dataSource?.calculateIndexPathsToReload(from: pokemonList.results) else {
      return
    }
    contentView.collectionView.reloadItems(at: indexPathsForReload)
  }
}

// MARK: - CollectionViewDataSource
extension PokemonListViewController: UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return dataSource?.numberOfItems(in: section) ?? 0
 //dataSource?.pokemonList.count ?? 0
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let item = dataSource?.item(at: indexPath) else { return UICollectionViewCell() }
    let pokemonListCell: PokemonListCell = collectionView.dequeuReusableCell(forIndexPath: indexPath)
    if isLoadingCell(for: indexPath) {
      pokemonListCell.update(PokemonListCell.ViewModel(name: "Loading name"))
    } else {
      switch item {
      case .pokemonItem(let item):
        pokemonListCell.update(item)
      }
    }
    return pokemonListCell
  }
}

// MARK: - CollectionViewDelegate
extension PokemonListViewController: UICollectionViewDelegate {
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    //    presenter?.onItemSelected(at: indexPath)
  }
}

extension PokemonListViewController: UICollectionViewDataSourcePrefetching {
  func collectionView(_ collectionView: UICollectionView, prefetchItemsAt indexPaths: [IndexPath]) {
    if indexPaths.contains(where: isLoadingCell) {
      presenter?.onPrefetchRequested()
    }
  }
}

// MARK: - Private methods
private extension PokemonListViewController {
  @objc func favoritesButtonTapped() {
    presenter?.onFavouritesSelected()
  }
}

private extension PokemonListViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    setupCollectionView()
  }
  
  func setupCollectionView() {
    contentView.collectionView.dataSource = self
    contentView.collectionView.delegate = self
    contentView.collectionView.prefetchDataSource = self
    contentView.collectionView.isPrefetchingEnabled = true
  }
  
  func setupNaviagtionBar() {
    navigationItem.rightBarButtonItem = .favourites(target: self, action: #selector(favoritesButtonTapped))
    guard let username = KeychainRepository.username else {
      return
    }
    navigationItem.title = "Welcome \(username)"
  }
}

// MARK: - Utility methods
private extension PokemonListViewController {
  func isLoadingCell(for indexPath: IndexPath) -> Bool {
    return indexPath.row >= dataSource?.currentOffset() ?? 0
  }
  
  func visibleIndexPathsToReload(intersecting indexPaths: [IndexPath]) -> [IndexPath] {
    let indexPathsForVisibleRows = contentView.collectionView.indexPathsForVisibleItems
    let indexPathsIntersection = Set(indexPathsForVisibleRows).intersection(indexPaths)
    return Array(indexPathsIntersection)
  }
}
