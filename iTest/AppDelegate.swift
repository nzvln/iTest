//
//  AppDelegate.swift
//  HabitusFINAL
//
//  Created by Nadia on 16.02.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  
  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = UIColor.white
    window?.makeKeyAndVisible()
      window?.rootViewController = UINavigationController(rootViewController: ViewController())
    return true
  }
}

