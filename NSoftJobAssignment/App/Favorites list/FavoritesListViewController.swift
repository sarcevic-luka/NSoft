//
//  FavoritesListViewController.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 01.09.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Model

protocol FavoritesListDisplayLogic: AnyObject {
  func displayFavorites(using dataSource: FavoritesListDataSource)
}

class FavoritesListViewController: UIViewController, NavigationBarSetupable {
  var presenter: FavoritesListViewPresentingLogic?
  var backButtonTapSelector: Selector { #selector(backBarButtonItemTapped) }
  private var dataSource: FavoritesListDataSource?
  private lazy var contentView = FavoritesListContentView()
  
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
    presenter?.onViewWillAppear()
  }
}

// MARK: - FavoritesListDisplayLogic
extension FavoritesListViewController: FavoritesListDisplayLogic {
  func displayFavorites(using dataSource: FavoritesListDataSource) {
    self.dataSource = dataSource
    UIView.transition(with: contentView.tableView, duration: 1.0, options: .transitionCrossDissolve, animations: { self.contentView.tableView.reloadData() }, completion: nil)
  }
}

// MARK: - Private Methods
private extension FavoritesListViewController {
  @objc func backBarButtonItemTapped() {
    presenter?.onBackBarButtonItemTapped()
  }
}

// MARK: - UITableViewDataSource
extension FavoritesListViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    dataSource?.numberOfItems(in: section) ?? 0
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let item = dataSource?.item(at: indexPath) else {
      return UITableViewCell()
    }
    
    switch item {
    case .pokemonItem(let item):
      let cell = tableView.dequeueReusableCell(FavoritesListCell.self, at: indexPath)
      cell.update(item)
      return cell
    }
  }
}

// MARK: - UITableViewDelegate
extension FavoritesListViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    presenter?.onItemSelected(at: indexPath)
  }
  
  func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
    return true
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if (editingStyle == .delete) {
      presenter?.onItemDeleted(at: indexPath)
    }
  }
}

private extension FavoritesListViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    setupTableView()
  }
  
  func setupTableView() {
    contentView.tableView.dataSource = self
    contentView.tableView.delegate = self
  }
  
  func setupNaviagtionBar() {
    setupDefaultBackButtonItem()
    navigationItem.title = "Favorites"
  }
}
