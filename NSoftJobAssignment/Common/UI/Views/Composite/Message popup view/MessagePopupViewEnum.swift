//
//  MessagePopupViewEnum.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 01.09.2021..
//

import UIKit
import Assets

extension MessagePopupView {
  public enum State {
    case noInternetConnection
    case customError(String)
    case serverUnreachable
    
    var image: UIImage {
      switch self {
      case .customError, .serverUnreachable:
        return ImageAssets.Icons.error.image
      case .noInternetConnection:
        return ImageAssets.Icons.warning.image
      }
    }
    
    var title: String {
      switch self {
      case .noInternetConnection:
        return "Internet problems"
      case .customError:
        return "Error"
      case .serverUnreachable:
        return "Server problems"
      }
    }
    
    var subtitle: String? {
      switch self {
      case .noInternetConnection:
        return "Oops, looks like you have lost your internet connection :("
      case .customError(let localizedDescription):
        return localizedDescription
      case .serverUnreachable:
        return "Looks like wild Magikarp wandered on our servers, and caused the mess. sorry for the inconvenience and please try later"
      }
    }
    
    var backgroundColor: UIColor {
      return .white
    }
  }
}
