//
//  PokemonListCell.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 31.08.2021..
//

import UIKit
import Assets
import Model

class PokemonListCell: UICollectionViewCell {
  struct ViewModel {
    let name: String?
  }
  private(set) lazy var containerView = UIView()
  private lazy var indicatorView = UIActivityIndicatorView()
  private lazy var titleLabel = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension PokemonListCell {
  func update(_ viewModel: ViewModel) {
    guard let pokemonName = viewModel.name else {
      indicatorView.startAnimating()
      titleLabel.text = ""
      return
    }
    titleLabel.text = pokemonName
    indicatorView.stopAnimating()
  }
}

// MARK: - Private Methods
private extension PokemonListCell {
  func setupViews() {
    setupView()
    setupIndicatorView()
    setupContainerView()
    setupTitleLabel()
  }

  func setupView() {
    contentView.backgroundColor = .clear
  }

  func setupIndicatorView() {
    addSubview(indicatorView)
    indicatorView.snp.makeConstraints {
      $0.center.equalToSuperview()
    }
    indicatorView.hidesWhenStopped = true
    indicatorView.color = ColorAssets.General.pokeRed.color
  }
  
  func setupContainerView() {
    contentView.addSubview(containerView)
    containerView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
    containerView.backgroundColor = ColorAssets.General.pokeLightGray.color.withAlphaComponent(0.15)
    containerView.layer.cornerRadius = 6
  }
  
  func setupTitleLabel() {
    containerView.addSubview(titleLabel)
    titleLabel.snp.makeConstraints {
      $0.top.bottom.equalToSuperview().inset(20)
      $0.centerX.equalToSuperview()
    }
    titleLabel.font = .systemFont(ofSize: 16, weight: .bold)
    titleLabel.textAlignment = .center
    titleLabel.textColor = ColorAssets.General.pokeLightGray.color
  }
}
