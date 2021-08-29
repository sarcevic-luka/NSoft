//
//  Networking.swift
//  Networking
//
//  Created by Luka Šarčević on 29.08.2021..
//

import Foundation
import Alamofire

public final class Networking {
  internal static let session = Alamofire.Session(eventMonitors: [NetworkEventMonitor()])
}
