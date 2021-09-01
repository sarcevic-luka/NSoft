//
//  PokemonDetailsViewController.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Model

protocol PokemonDetailsDisplayLogic: AnyObject {
  func display(pokemonDetails: PokemonDetails)
  func displayButton(isFavorite: Bool)
}

class PokemonDetailsViewController: UIViewController, NavigationBarSetupable {
  var presenter: PokemonDetailsViewPresentingLogic?
  var backButtonTapSelector: Selector { #selector(backBarButtonItemTapped) }
  private lazy var contentView = PokemonDetailsContentView()
  
  override func loadView() {
    view = contentView
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
  
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    presenter?.onViewWillAppear()
    setupNaviagtionBar()
  }
}

// MARK: - PokemonDetailsDisplayLogic
extension PokemonDetailsViewController: PokemonDetailsDisplayLogic {
  func display(pokemonDetails: PokemonDetails) {
    contentView.update(pokemonDetails: pokemonDetails)
    title = pokemonDetails.name.capitalizingFirstLetter()
  }
  
  func displayButton(isFavorite: Bool) {
    contentView.setButton(isFavorite: isFavorite)
  }
}

// MARK: - Private Methods
private extension PokemonDetailsViewController {
  @objc func backBarButtonItemTapped() {
    presenter?.onBackBarButtonItemTapped()
  }
}
private extension PokemonDetailsViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    contentView.favoritesTapHandler = { [weak self] in
      self?.presenter?.onFavoritesButtonTapped()
    }
  }
  
  func setupNaviagtionBar() {
    setupDefaultBackButtonItem()
  }
}
