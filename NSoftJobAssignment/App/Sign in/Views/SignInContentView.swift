//
//  SignInContentView.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 30.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import Assets
import SnapKit

class SignInContentView: UIView {
  var viewTapHandler: Action?
  var usernameFilledHandler: ParametrisedAction<Bool>?
  var continueTapHandler: ParametrisedAction<String>?
  private lazy var welcomeTitleLabel = UILabel()
  private lazy var inputInstructionsLabel = UILabel()
  private(set) var usernameInputTextField = UITextField()
  private(set) var continueButton = ActionButton.continueLogin(target: self, selector: #selector(continueButtonTapped))
  private var defaultWidthMultiplier: CGFloat { 335.0 / 375.0 }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  override func resignFirstResponder() -> Bool {
    endEditing(true)
  }
}

extension SignInContentView {
  func continueButton(buttonIsEnabled: Bool) {
    continueButton.backgroundColor = buttonIsEnabled ? ColorAssets.General.pokeBlue.color : ColorAssets.General.pokeLightGray.color
  }
  
  func notifyEmptyName() {
    inputInstructionsLabel.shake()
    continueButton.shake()
  }
}

// MAKR: - Actions
private extension SignInContentView {
  @objc func textFieldTextChanged(_ sender: UITextField) {
    guard let username = sender.text else {
      usernameFilledHandler?(false)
      return
    }
    usernameFilledHandler?(username.count > 0)
  }
  
  @objc func textFieldTextEndEditing(_ sender: UITextField) {
    viewTapHandler?()
  }
  
  @objc func continueButtonTapped() {
    guard let username = usernameInputTextField.text else {
      return
    }
    continueTapHandler?(username)
  }
  
  @objc func viewTapped() {
    viewTapHandler?()
  }
}

// MARK: - Private Methods
private extension SignInContentView {
  func setupViews() {
    setupView()
    setupWelcomeTitleLabel()
    setupInputInstructionsLabel()
    setupUsernameInputTextField()
    setupContinueButton()
  }
  
  func setupView() {
    backgroundColor = .white
    addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(viewTapped)))
  }
  
  func setupWelcomeTitleLabel() {
    addSubview(welcomeTitleLabel)
    welcomeTitleLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview().multipliedBy(0.35)
      $0.centerX.equalToSuperview()
    }
    welcomeTitleLabel.text = "Welcome"
    welcomeTitleLabel.font = .pokeFont(size: 45, weight: .solid)
    welcomeTitleLabel.textColor = ColorAssets.General.pokeBlue.color
  }
  
  func setupInputInstructionsLabel() {
    addSubview(inputInstructionsLabel)
    inputInstructionsLabel.snp.makeConstraints {
      $0.top.greaterThanOrEqualTo(welcomeTitleLabel.snp.bottom).inset(-60).priority(.high)
      $0.centerY.equalToSuperview().multipliedBy(0.8)
      $0.centerX.equalToSuperview()
    }
    inputInstructionsLabel.text = "Please enter your username:"
    inputInstructionsLabel.textColor = ColorAssets.General.pokeLightGray.color
    inputInstructionsLabel.font = .pokeFont(size: 18, weight: .solid)
  }
  
  func setupUsernameInputTextField() {
    addSubview(usernameInputTextField)
    usernameInputTextField.snp.makeConstraints {
      $0.top.equalTo(inputInstructionsLabel.snp.bottom).inset(-24)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(defaultWidthMultiplier)
    }
    usernameInputTextField.textAlignment = .center
    usernameInputTextField.placeholder = "Tap to start typing"
    usernameInputTextField.addTarget(self, action: #selector(textFieldTextChanged(_:)), for: .editingChanged)
  }
  
  func setupContinueButton() {
    addSubview(continueButton)
    continueButton.snp.makeConstraints {
      $0.bottom.equalToSuperview().inset(45)
      $0.centerX.equalToSuperview()
      $0.width.equalToSuperview().multipliedBy(defaultWidthMultiplier)
    }
  }
}
