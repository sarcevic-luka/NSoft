//
//  ApiResponseContainer.swift
//  Networking
//
//  Created by Luka Šarčević on 29.08.2021..
//

import Foundation

struct ApiResponseContainer<T: Decodable> {
  let data: T
}

extension ApiResponseContainer: Decodable { }

struct ApiResponseArrayContainer<T: Decodable> {
  let data: [T]
}

extension ApiResponseArrayContainer: Decodable { }
