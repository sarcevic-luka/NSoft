//
//  PersistenceStartupProcess.swift
//  Persistence
//
//  Created by Luka Šarčević on 01.09.2021..
//

import Foundation
import Model
import Promises
import GRDB

public protocol PersistenceStartupProcessProtocol {
  func setFavorites() -> Promise<(Void)>
}

public final class PersistenceStartupProcess {
  public init() { }
}

extension PersistenceStartupProcess: PersistenceStartupProcessProtocol {
  public func setFavorites() -> Promise<(Void)> {
    Promise { fullfill, reject in
      try Persistence.dbQueue
        .write { db in
          do {
            try db.create(table: PersistanceTableEnum.favoritesList.rawValue) { t in
              t.column("id", .integer).primaryKey()
              t.column("name", .text).notNull()
              t.column("baseExperience", .integer).notNull()
              t.column("weight", .integer).notNull()
              t.column("types", .text).notNull()
            }
          } catch {
            debugPrint(error)
          }
        }
      fullfill(())
    }
  }
}
