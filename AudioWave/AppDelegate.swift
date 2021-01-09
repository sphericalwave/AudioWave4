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
    let appModel = AppModel()

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
    {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.makeKeyAndVisible()
        
        
        let playerUI1 = PlayerUI(audioSource: appModel.playlistCombo.musicSource) //FIXME: Encapsulation
        let playerUI2 = PlayerUI(audioSource: appModel.playlistCombo.bookSource) //FIXME: Encapsulation

        let scroller = Scroller(playbackScreen1: playerUI1,
                                playbackScreen2: playerUI2,
                                state: appModel.playlistCombo.state) //FIXME: Encapsulation
        let crossFader = CrossFader(audioWave: appModel.playlistCombo)
        let mainScreen = MainScreen(
            scrollScreen: scroller,
            crossFader: crossFader,
            playlistCombo: appModel.playlistCombo)

        let nav = UINavigationController(rootViewController: mainScreen)
        nav.navigationBar.barStyle = .black
        
        window?.rootViewController = nav
        return true
    }
}
