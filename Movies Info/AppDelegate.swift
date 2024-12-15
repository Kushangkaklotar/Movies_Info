//
//  AppDelegate.swift
//  Movies Info
//
//  Created by Kushang  on 31/10/24.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    var navVC : UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        self.navigation()
        return true
    }

    func navigation(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let vc = storyboard.instantiateViewController(withIdentifier: "ViewController") as? ViewController {
            self.navVC = UINavigationController(rootViewController: vc)
            self.navVC?.isNavigationBarHidden = true
            self.navVC?.interactivePopGestureRecognizer?.isEnabled = false
            self.navVC?.interactivePopGestureRecognizer?.delegate = nil
            self.window?.rootViewController = nil
            self.window?.rootViewController = navVC
            self.window?.makeKeyAndVisible()
        }
//        window = UIWindow(frame: UIScreen.main.bounds)
//        let mainController = ViewController() as ViewController
//        let navigationController = UINavigationController(rootViewController: mainController)
//        navigationController.navigationBar.isHidden = true
//        self.window?.rootViewController = navigationController
//        self.window?.makeKeyAndVisible()
    }
}

