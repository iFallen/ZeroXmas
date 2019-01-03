//
//  AppDelegate.swift
//  ZeroXmas
//
//  Created by JuanFelix on 01/03/2019.
//  Copyright (c) 2019 JuanFelix. All rights reserved.
//

import UIKit
import ZeroXmas

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var tabBar: UITabBarController!

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        window = UIWindow()
        
        ZXConfig.loadUIConfig()
        //ZXConfig.loadNavBarConfig()
        //ZXConfig.loadTabBarConfig()
        
        tabBar = UITabBarController()
        tabBar.zx.addChild(T1ViewController(), fromPlistItemIndex: 0)
        tabBar.zx.addChild(T2ViewController(), fromPlistItemIndex: 1)
        tabBar.zx.addChild(T3ViewController(), fromPlistItemIndex: 2)//showAsPresent
        tabBar.zx.addChild(T4ViewController(), fromPlistItemIndex: 3)
        tabBar.zx.addChild(T5ViewController(), fromPlistItemIndex: 4)
        
        tabBar.delegate = self
        
        
        window?.rootViewController = tabBar
        window?.makeKeyAndVisible()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
}

extension AppDelegate: UITabBarControllerDelegate {
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        return UITabBarController.zx.tabBarController(tabBarController, shouldSelectViewController: viewController)
    }
}
