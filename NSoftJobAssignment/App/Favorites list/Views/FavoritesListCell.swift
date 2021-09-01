//
//  FavoritesListCell.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 01.09.2021..
//

import UIKit
import Assets

class FavoritesListCell: UITableViewCell {
  struct ViewModel {
    let name: String
    let imageId: Int
    let types: String
  }

  private lazy var containerView = UIView()
  private lazy var pokemonImageView = UIImageView()
  private lazy var nameLabel = UILabel()
  private lazy var typesLabel = UILabel()
  private var defaultWidthMultiplier: CGFloat { 335.0 / 375.0 }

  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupViews()
  }
  
  @available(*, unavailable)
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension FavoritesListCell {
  func update(_ viewModel: ViewModel) {
    let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(viewModel.imageId).png")
    pokemonImageView.kf.setImage(
      with: url,
      placeholder: ImageAssets.Icons.pokeball.image,
      options: [
        .transition(.fade(1)),
        .cacheOriginalImage
      ])
    
    nameLabel.text = viewModel.name
    typesLabel.text = viewModel.types
  }
}

// MARK: - Private Methods
private extension FavoritesListCell {
  func setupViews() {
    setupView()
    setupContainerView()
    setupPokemonImageView()
    setupNameLabel()
    setupTypesLabel()
  }

  func setupView() {
    selectionStyle = .none
  }

  func setupContainerView() {
    addSubview(containerView)
    containerView.snp.makeConstraints {
      $0.edges.equalToSuperview().inset(20)
    }
    containerView.backgroundColor = ColorAssets.General.pokeLightGray.color.withAlphaComponent(0.15)
    containerView.layer.cornerRadius = 6
  }
  
  func setupPokemonImageView() {
    containerView.addSubview(pokemonImageView)
    pokemonImageView.snp.makeConstraints {
      $0.top.leading.bottom.equalToSuperview().inset(5)
      $0.size.equalTo(120)
    }
  }
  
  func setupNameLabel() {
    containerView.addSubview(nameLabel)
    nameLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview().offset(-15)
      $0.leading.equalTo(pokemonImageView.snp.trailing).offset(15)
      $0.trailing.equalToSuperview().inset(12)
    }
    nameLabel.font = .systemFont(ofSize: 16, weight: .bold)
    nameLabel.textAlignment = .left
    nameLabel.textColor = ColorAssets.General.pokeLightGray.color
    nameLabel.numberOfLines = 0
  }
  
  func setupTypesLabel(){
    containerView.addSubview(typesLabel)
    typesLabel.snp.makeConstraints {
      $0.top.equalTo(nameLabel.snp.bottom).offset(12)
      $0.leading.equalTo(pokemonImageView.snp.trailing).offset(15)
      $0.trailing.equalToSuperview().inset(12)
    }
    typesLabel.font = .systemFont(ofSize: 16, weight: .medium)
    typesLabel.textAlignment = .left
    typesLabel.textColor = ColorAssets.General.pokeLightGray.color
  }
}
