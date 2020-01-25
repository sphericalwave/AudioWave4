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
        let audioHardware = AudioHardware()
        let notifications = Notifications()
        let t = Titles()
        let p = Progress()
        let b = Buttons()
        let a = Artwork(art: #imageLiteral(resourceName: "NoteSpace"))
        let player1 = Player(titles: t, buttons: b, progress: p, artwork: a) //FIXME: Add player2
        b.delegate = player1    //TODO: Implement Guards
        p.delegate = player1
        let nowPlaying = NowPlaying(musicPlayer: player1, audioPlayer: player1)
        let p1 = PlayerScreen(player: player1, titles: t, buttons: b, progress: p, artwork: a)
        let p2 = PlayerScreen(player: player1, titles: t, buttons: b, progress: p, artwork: a)
        let sS = Scroller(playbackScreen1: p1, playbackScreen2: p2)
        let cF = CrossFader(player1: player1, player2: player1)
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
