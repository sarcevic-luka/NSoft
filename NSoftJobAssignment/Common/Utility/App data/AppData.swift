//
//  AppData.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 30.08.2021..
//

import Networking

final class AppData { }

// MARK: AppDataProtocol
extension AppData: AppDataProtocol {
  var username: String? {
    get { KeychainRepository.username }
    set { KeychainRepository.username = newValue }
  }
}
