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
        if AuthService.isGuest() {
            login()
        } else {
            mainRoot()
        }
        
        window?.makeKeyAndVisible()
        return true
    }
    func mainRoot() {
        window?.rootViewController?.dismiss(animated: false, completion: nil)
        window?.rootViewController = nil
        window?.rootViewController = Navigator.instance.getMainRoot()
    }

    func login() {
        window?.rootViewController?.dismiss(animated: false, completion: nil)
        window?.rootViewController = nil
        window?.rootViewController = Navigator.instance.getLoginRoot()
    }
}

