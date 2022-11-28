//
//  AppDelegate.swift
//  NewApp
//
//  Created by Fagan Aslanli on 12.11.22.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    static let shared = AppDelegate()
    
    var window: UIWindow?
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        return true
    }
    
    func login() {
        window?.rootViewController = Navigator.instance.getLoginRoot()
        window?.makeKeyAndVisible()
    }
    func main() {
        window?.rootViewController = Navigator.instance.getMainRoot()
        window?.makeKeyAndVisible()
    }
}

