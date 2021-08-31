//
//  AppearanceCustomisationStartupProcess.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 30.08.2021..
//

import UIKit
import Assets

final class AppearanceCustomisationStartupProcess: StartupProcess {
  func run(completion: @escaping (Bool) -> Void) {
    setupNavigationBarAppearance()
    completion(true)
  }
}

private extension AppearanceCustomisationStartupProcess {
  func setupNavigationBarAppearance() {
    UINavigationBar.appearance().barTintColor = ColorAssets.General.pokeRed.color
    let appearance = UINavigationBarAppearance()
    appearance.configureWithTransparentBackground()
    appearance.backgroundColor = ColorAssets.General.pokeRed.color
    appearance.titleTextAttributes = [
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20, weight: .medium),
      NSAttributedString.Key.foregroundColor: UIColor.white
    ]
    UINavigationBar.appearance().standardAppearance = appearance
  }
}
