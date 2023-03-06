//
//  AppDelegate.swift
//  SparrowCodeE2
//
//  Created by Коцур Тарас Сергійович on 05.03.2023.
//

import UIKit

@main
final class AppDelegate: UIResponder, UIApplicationDelegate {
  
  // MARK: - Properties
  
  var window: UIWindow?
  
  // MARK: - Life cycle methods

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    let window = UIWindow()
    
    let viewController = MainViewController()
    
    window.rootViewController = viewController
    window.makeKeyAndVisible()
    
    self.window = window
    
    return true
  }
}

