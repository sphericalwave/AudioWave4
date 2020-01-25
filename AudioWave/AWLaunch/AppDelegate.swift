//
//  AppDelegate.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-09.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate
{
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        let p1 = PlayerScreen()
        let p2 = PlayerScreen()
        let sS = Scroller(playbackScreen1: p1, playbackScreen2: p2)
        let cF = CrossFader()
        let mainScreen = MainScreen(scrollScreen: sS, crossFader: cF)
        let mainScreenNav = UINavigationController(rootViewController: mainScreen)
        mainScreenNav.navigationBar.barStyle = .black
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        window?.rootViewController = mainScreenNav
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) { }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }
}
