//
//  AppDataProtocol.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 30.08.2021..
//

import Foundation
import Networking

protocol AppDataProtocol: AnyObject {
  var username: String? { get set }
  var isUserSignedIn: Bool { get }
}

extension AppDataProtocol {
  var isUserSignedIn: Bool { username != nil }
}
