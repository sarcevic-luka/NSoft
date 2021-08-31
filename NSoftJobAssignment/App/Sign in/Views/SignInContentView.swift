//
//  SignInContentView.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 30.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit
import SnapKit

class SignInContentView: UIView {
  var continueTapHandler: Action?
  var     viewTapHandler: Action?
  var usernameTextChangeHandler: ParametrisedAction<String?>?
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
}

extension SignInContentView {
  var continueButtonEnabled: Bool {
    get { continueButton.isEnabled }
    set { continueButton.isEnabled = newValue}
  }
}

// MAKR: - Actions
private extension SignInContentView {
  @objc func textFieldTextChanged(_ sender: UITextField) {
    guard let value = sender.text else { return }
    usernameTextChangeHandler?(value)
  }
  
  @objc func textFieldTextEndEditing(_ sender: UITextField) {
    viewTapHandler?()
  }
  
  @objc func continueButtonTapped() {
    continueTapHandler?()
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
    let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewTapped))
    addGestureRecognizer(tapGesture)
  }
  
  func setupWelcomeTitleLabel() {
    addSubview(welcomeTitleLabel)
    welcomeTitleLabel.snp.makeConstraints {
      $0.centerY.equalToSuperview().multipliedBy(0.35)
      $0.centerX.equalToSuperview()
    }
    welcomeTitleLabel.text = "Welcome"
    welcomeTitleLabel.font = .systemFont(ofSize: 30, weight: .bold)
  }
  
  func setupInputInstructionsLabel() {
    addSubview(inputInstructionsLabel)
    inputInstructionsLabel.snp.makeConstraints {
      $0.top.greaterThanOrEqualTo(welcomeTitleLabel.snp.bottom).inset(-60).priority(.high)
      $0.centerY.equalToSuperview().multipliedBy(0.8)
      $0.centerX.equalToSuperview()
    }
    inputInstructionsLabel.text = "Please enter your username:"
    inputInstructionsLabel.textColor = .darkGray
    inputInstructionsLabel.font = .systemFont(ofSize: 18, weight: .semibold)
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
