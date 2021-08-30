//
//  StartupProcessService.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 30.08.2021..
//

import Foundation

public final class StartupProcessService {
  public init() { }

  @discardableResult
  public func execute(process: StartupProcess) -> StartupProcessService {
    process.run { guard $0 else { return } }
    return self
  }
}
