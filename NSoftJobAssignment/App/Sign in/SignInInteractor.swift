//
//  SignInInteractor.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 30.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Promises

protocol SignInBusinessLogic: AnyObject {
  func login(username: String) -> Promise<Void>
}

class SignInInteractor {
  private let appData: AppDataProtocol

  init(appData: AppDataProtocol = AppData()) {
    self.appData = appData
  }
}

// MARK: - SignInBusinessLogic
extension SignInInteractor: SignInBusinessLogic {
  func login(username: String) -> Promise<Void> {
    Promise { [weak self] fullfill, _ in
      self?.appData.username = username
      fullfill(())
    }
  }
}
