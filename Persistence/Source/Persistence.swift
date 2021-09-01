//
//  Persistence.swift
//  Persistence
//
//  Created by Luka Šarčević on 01.09.2021..
//

import Foundation
import GRDB

public final class Persistence {
  internal static let dbQueue: DatabaseQueue = {
    let databaseURL = try! FileManager.default
      .url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
      .appendingPathComponent("db.sqlite")
    return try! DatabaseQueue(path: databaseURL.path)
  }()
}
