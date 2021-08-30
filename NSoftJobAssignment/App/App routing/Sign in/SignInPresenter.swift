//
//  SignInPresenter.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 30.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol SignInViewPresentingLogic: AnyObject { }

class SignInPresenter {
  var interactor: SignInBusinessLogic?
  weak private var view: SignInDisplayLogic?
  private let router: SignInRoutingLogic
  
  init(interface: SignInDisplayLogic, interactor: SignInBusinessLogic?, router: SignInRoutingLogic) {
    self.view = interface
    self.interactor = interactor
    self.router = router
  }
}

// MARK: - SignInViewPresentingLogic
extension SignInPresenter: SignInViewPresentingLogic { }
