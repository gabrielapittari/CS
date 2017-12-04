//
//  AppDelegate.swift
//  test
//
//  Created by Gabriela Pittari on 04/12/2017.
//  Copyright © 2017 cs. All rights reserved.
//
import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        /// start new window
        window = UIWindow(frame: UIScreen.main.bounds)
        let viewModel = ScoreViewModel()
        let viewController = ScoreViewController(viewModel: viewModel)
        let navigationController = UINavigationController(rootViewController: viewController)
        window!.rootViewController = navigationController
        window!.makeKeyAndVisible()
        return true
    }
}
