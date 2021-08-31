//
//  SignInViewController.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 30.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SignInDisplayLogic: AnyObject { }

class SignInViewController: UIViewController {
  var presenter: SignInViewPresentingLogic?
  private lazy var contentView = SignInContentView()
  
  override func loadView() {
    view = contentView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }
}

// MARK: - SignInDisplayLogic
extension SignInViewController: SignInDisplayLogic { }

private extension SignInViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() { }
}
