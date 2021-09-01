//
//  PokemonListContentView.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 31.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class PokemonListContentView: UIView {
  private(set) lazy var collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
  private lazy var layout = ListLayoutVendor(estimatedItemHeight: estimatedItemHeight, sectionInsets: sectionInsets, interGroupSpacing: CGFloat(12)).vendLayout()
  private let sectionInsets = NSDirectionalEdgeInsets(top: 16, leading: 20, bottom: 12, trailing: 20)
  private let estimatedItemHeight: CGFloat = 60
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension PokemonListContentView {
  func setupViews() {
    setupView()
    setupCollectionView()
  }
  
  func setupView() {
    backgroundColor = .white
  }
  
  func setupCollectionView() {
    addSubview(collectionView)
    collectionView.snp.makeConstraints {
      $0.top.bottom.equalTo(safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
    }
    collectionView.backgroundColor = .clear
    collectionView.alwaysBounceVertical = true
    collectionView.keyboardDismissMode = .onDrag
    collectionView.register(PokemonListCell.self)
  }
}
