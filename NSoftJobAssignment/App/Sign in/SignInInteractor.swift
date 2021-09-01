//
//  SignInInteractor.swift
//  NSoftJobAssignment
//
//  Created Luka Šarčević on 30.08.2021..
//  Copyright © 2021 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation
import Persistence
import Promises

protocol SignInBusinessLogic: AnyObject {
  func login(username: String) -> Promise<Void>
}

class SignInInteractor {
  private let appData: AppDataProtocol
  private let persistenceStartupProcess: PersistenceStartupProcessProtocol
    
  init(appData: AppDataProtocol = AppData(),
       persistenceStartupProcess: PersistenceStartupProcessProtocol = PersistenceStartupProcess()) {
    self.appData = appData
    self.persistenceStartupProcess = persistenceStartupProcess
  }
}

// MARK: - SignInBusinessLogic
extension SignInInteractor: SignInBusinessLogic {
  func login(username: String) -> Promise<Void> {
    persistenceStartupProcess.setFavorites()
      .then { [weak self] in
        self?.appData.username = username
      }
  }
}
