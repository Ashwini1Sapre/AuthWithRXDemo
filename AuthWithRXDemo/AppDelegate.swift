//
//  AppDelegate.swift
//  AuthWithRXDemo
//
//  Created by Knoxpo MacBook Pro on 16/01/21.
//

import UIKit
import Firebase
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    var appCoordinator: AppCoordinator!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        
        window = UIWindow()
        appCoordinator = AppCoordinator(withWindow: window!)
        appCoordinator.start()
        window?.makeKeyAndVisible()
        // Override point for customization after application launch.
        return true
    }

   

    


}

