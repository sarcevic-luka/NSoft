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
}

class PokemonDetailsViewController: UIViewController {
  var presenter: PokemonDetailsViewPresentingLogic?
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
  }
}

// MARK: - PokemonDetailsDisplayLogic
extension PokemonDetailsViewController: PokemonDetailsDisplayLogic {
  func display(pokemonDetails: PokemonDetails) {
    contentView.update(pokemonDetails: pokemonDetails, isFavorite: true)
  }
}

private extension PokemonDetailsViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {

  }
}
