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

extension SignInViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    return contentView.usernameInputTextField.resignFirstResponder()
  }
}

// MARK: - Private Methods
private extension SignInViewController {
  func setupView() {
    setupContentView()
  }
  
  func setupContentView() {
    contentView.viewTapHandler = { [weak self] in
      _ = self?.contentView.resignFirstResponder()
    }
    contentView.continueTapHandler = { [weak self] username in
      self?.presenter?.onContinueButtonTapped(with: username)
    }
    contentView.usernameFilledHandler = { [weak self]  usernameIsFilled in
      self?.contentView.continueButtonEnabled = usernameIsFilled
    }
    contentView.usernameInputTextField.delegate = self
  }
}
