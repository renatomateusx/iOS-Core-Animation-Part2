//
//  AppDelegate.swift
//  CoreAnimationPart2
//
//  Created by Renato Mateus on 31/05/21.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow()
    window?.makeKeyAndVisible()
    window?.rootViewController = UINavigationController(rootViewController: ViewController())
    return true
  }

  


}

