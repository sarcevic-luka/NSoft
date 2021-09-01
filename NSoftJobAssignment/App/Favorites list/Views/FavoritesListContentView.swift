//
//  FavoritesListContentView.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

class FavoritesListContentView: UIView {
  private(set) lazy var tableView = UITableView(frame: .zero, style: .plain)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}

// MARK: - Private Methods
private extension FavoritesListContentView {
  func setupViews() {
    setupView()
    setupTableView()
  }
  
  func setupView() {
    backgroundColor = .white
  }
  
  func setupTableView() {
    addSubview(tableView)
    tableView.snp.makeConstraints {
      $0.top.bottom.equalTo(safeAreaLayoutGuide)
      $0.leading.trailing.equalToSuperview()
    }
    tableView.backgroundColor = .clear
    tableView.alwaysBounceVertical = true
    tableView.separatorStyle = .none
    tableView.register(FavoritesListCell.self)
  }
}
