//
//  AppearanceCustomisationStartupProcess.swift
//  NSoftJobAssignment
//
//  Created by Luka Šarčević on 30.08.2021..
//

import UIKit

final class AppearanceCustomisationStartupProcess: StartupProcess {
  func run(completion: @escaping (Bool) -> Void) {
    setupNavigationBarAppearance()
    
    completion(true)
  }
}

private extension AppearanceCustomisationStartupProcess {
  func setupNavigationBarAppearance() {
    UINavigationBar.appearance().barTintColor = .white
    let appearance = UINavigationBarAppearance()
    appearance.configureWithTransparentBackground()
    appearance.backgroundColor = UIColor.systemBackground.withAlphaComponent(0.10)
    appearance.titleTextAttributes = [
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
      NSAttributedString.Key.foregroundColor: UIColor.white
    ]
    appearance.largeTitleTextAttributes = [
      NSAttributedString.Key.font: UIFont.systemFont(ofSize: 18, weight: .bold),
      NSAttributedString.Key.foregroundColor: UIColor.white
    ]
    UINavigationBar.appearance().standardAppearance = appearance
  }
}
