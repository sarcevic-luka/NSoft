//
//  PokemonDetailsContentView.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Assets
import Model
import Kingfisher
import SnapKit

class PokemonDetailsContentView: UIView {
  var favoritesTapHandler: Action?
  private lazy var imageView = UIImageView()
  private lazy var verticalTitlesStackView = UIStackView()
  private lazy var verticalValuesStackView = UIStackView()
  private lazy var baseExperienceTitleLabel = UILabel()
  private lazy var baseExperienceValueLabel = UILabel()
  private lazy var weightTitleLabel = UILabel()
  private lazy var weightValueLabel = UILabel()
  private lazy var typesTitleLabel = UILabel()
  private lazy var typesValueLabel = UILabel()
  private(set) var favoritesButton = ActionButton.favorites(target: self, selector: #selector(favoritesButtonTapped))
  private var defaultWidthMultiplier: CGFloat { 335.0 / 375.0 }

  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

extension PokemonDetailsContentView {
  func update(pokemonDetails: PokemonDetails, isFavorite: Bool) {
    baseExperienceValueLabel.text = "\(pokemonDetails.baseExperience)"
    weightValueLabel.text = "\(pokemonDetails.weight)"
    let allTypes = pokemonDetails.types.map { "\($0.type.name)" }
    typesValueLabel.text = allTypes.joined(separator: "/")

    let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/\(pokemonDetails.id).png")
    imageView.kf.setImage(
      with: url,
      placeholder: ImageAssets.Icons.pokeball.image,
      options: [
          .transition(.fade(1)),
          .cacheOriginalImage
      ])
    
    //    favoritesButton.setTitle(willRemoveOnTouch ? "Remove from favorites" : "Add to favorites", for: .normal)
    //    favoritesButton.backgroundColor = willRemoveOnTouch ? ColorAssets.General.pokeRed.color : ColorAssets.General.pokeBlue.color

  }
}

// MARK: - Actions
private extension PokemonDetailsContentView {
  @objc func favoritesButtonTapped() {
    favoritesTapHandler?()
  }
}

// MARK: - UI setup
private extension PokemonDetailsContentView {
  func setupViews() {
    setupView()
    setupImageView()
    setupVerticalTitlesStackView()
    setupVerticalValuesStackView()
    setupTitlesLabels()
    setupValuesLabels()
    setupFavoritesButton()
  }
  
  func setupView() {
    backgroundColor = .white
  }
  
  func setupImageView() {
    addSubview(imageView)
    imageView.snp.makeConstraints {
      $0.top.equalTo(safeAreaLayoutGuide).inset(30)
      $0.centerX.equalToSuperview()
      $0.size.equalTo(140)
    }
    imageView.image = ImageAssets.Icons.pokeball.image
    imageView.layer.borderWidth = 1
    imageView.layer.borderColor = ColorAssets.General.pokeLightGray.color.cgColor
  }
  
  func setupVerticalTitlesStackView() {
    addSubview(verticalTitlesStackView)
    verticalTitlesStackView.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).inset(-30)
      $0.leading.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.48)
      $0.height.equalTo(120)
    }
    verticalTitlesStackView.alignment = .trailing
    verticalTitlesStackView.distribution = .fillEqually
    verticalTitlesStackView.axis = .vertical
  }
  
  func setupVerticalValuesStackView() {
    addSubview(verticalValuesStackView)
    verticalValuesStackView.snp.makeConstraints {
      $0.top.equalTo(imageView.snp.bottom).inset(-30)
      $0.trailing.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(0.48)
      $0.height.equalTo(120)
    }
    verticalValuesStackView.alignment = .leading
    verticalValuesStackView.distribution = .fillEqually
    verticalValuesStackView.axis = .vertical
  }
  
  func setupTitlesLabels() {
    let stackViewTitles = [baseExperienceTitleLabel, typesTitleLabel, weightTitleLabel]
    baseExperienceTitleLabel.text = "Base expirience:"
    typesTitleLabel.text = "Types:"
    weightTitleLabel.text = "Weight:"
    
    stackViewTitles.forEach { label in
      label.font = .systemFont(ofSize: 16, weight: .medium)
      label.textColor = ColorAssets.General.pokeLightGray.color
      verticalTitlesStackView.addArrangedSubview(label)
    }
  }
  
  func setupValuesLabels() {
    let stackViewTitles = [baseExperienceValueLabel, typesValueLabel, weightValueLabel]

    stackViewTitles.forEach { label in
      label.font = .systemFont(ofSize: 16, weight: .medium)
      label.textColor = ColorAssets.General.pokeLightGray.color
      label.text = " "
      verticalValuesStackView.addArrangedSubview(label)
    }
  }

  func setupFavoritesButton() {
    addSubview(favoritesButton)
    (favoritesButton).snp.makeConstraints {
      $0.bottom.equalToSuperview().inset(45)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(defaultWidthMultiplier)
    }
  }
}
