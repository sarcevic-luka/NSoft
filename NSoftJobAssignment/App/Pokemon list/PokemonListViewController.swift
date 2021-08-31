//
//  PokemonListViewController.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 31.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PokemonListDisplayLogic: class { }

class PokemonListViewController: UIViewController {
  var presenter: PokemonListViewPresentingLogic?
  private lazy var contentView = PokemonListContentView.autolayoutView()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - PokemonListDisplayLogic
extension PokemonListViewController: PokemonListDisplayLogic { }

private extension PokemonListViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    view.addSubview(contentView)
  }
}
