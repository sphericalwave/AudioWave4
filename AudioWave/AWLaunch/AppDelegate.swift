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
        window = UIWindow(frame: UIScreen.main.bounds) //else { fatalError() }
        window?.makeKeyAndVisible()
        window?.rootViewController = mainScreenNav //navController //containerVC //pageVC
        return true
    }
    
    func applicationWillResignActive(_ application: UIApplication) { }
    func applicationDidEnterBackground(_ application: UIApplication) { }
    func applicationWillEnterForeground(_ application: UIApplication) { }
    func applicationDidBecomeActive(_ application: UIApplication) { }
    func applicationWillTerminate(_ application: UIApplication) { }
}

//audioSessionManager = AudioSessionManager.sharedInstance    //TODO: This is hacky
//NotificationCenter.default.addObserver(forName: .AVAudioSessionInterruption, object: self, queue: .main, using: handleInterruption)

//TODO: Get Permission to Access Music Library in a proper way
//_ = AudioLibrary.audioBooks()

//UIApplication.shared.statusBarStyle = .lightContent
//setupNowPlayingInfoCenter()

//        let audioSession = AVAudioSession.sharedInstance()
//        let commandCenter = MPRemoteCommandCenter.shared()
//        let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
//        let notificationCenter = NotificationCenter.default
//        let audioPlayer = SWAudioPlayer(audioSession: audioSession, commandCenter: commandCenter, nowPlayingInfoCenter: nowPlayingInfoCenter, notificationCenter: notificationCenter, isMusicPlayer: true)
//        let playbackScreen = PlaybackScreen(audioPlayer: audioPlayer, notificationCenter: notificationCenter)
//        let navController = UINavigationController(rootViewController: playbackScreen)
        
        //Construct playback screen and embed it in a navController
//        let audioSession = AVAudioSession()
//        let commandCenter = MPRemoteCommandCenter()
//        let nowPlayingInfoCenter = MPNowPlayingInfoCenter()
//        let notificationCenter = NotificationCenter()
        
