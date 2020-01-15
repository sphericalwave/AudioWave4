//
//  AppDelegate.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-09.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit
import MediaPlayer

#warning("Refactor AppDelegate")
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    var audioSessionManager: AudioSessionManager?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        //let pageVC = PageVC(frame: UIScreen.main.bounds)
        
        //let initialStoryboard = UIStoryboard(name: "SWCrossFaderVC", bundle: nil)
        //let containerVC = initialStoryboard.instantiateInitialViewController()
        
        //Construct playback screen and embed it in a navController
//        let audioSession = AVAudioSession()
//        let commandCenter = MPRemoteCommandCenter()
//        let nowPlayingInfoCenter = MPNowPlayingInfoCenter()
//        let notificationCenter = NotificationCenter()
        
        let mainScreen = MainScreen()
        let mainScreenNav = UINavigationController(rootViewController: mainScreen)
        
        let audioSession = AVAudioSession.sharedInstance()
        let commandCenter = MPRemoteCommandCenter.shared()
        let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
        let notificationCenter = NotificationCenter.default
        let audioPlayer = SWAudioPlayer(audioSession: audioSession, commandCenter: commandCenter, nowPlayingInfoCenter: nowPlayingInfoCenter, notificationCenter: notificationCenter, isMusicPlayer: true)
        let playbackScreen = PlaybackScreen(audioPlayer: audioPlayer, notificationCenter: notificationCenter)
        let navController = UINavigationController(rootViewController: playbackScreen)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = mainScreenNav //navController //containerVC //pageVC
        window!.makeKeyAndVisible()
        
        //audioSessionManager = AudioSessionManager.sharedInstance    //TODO: This is hacky
        //NotificationCenter.default.addObserver(forName: .AVAudioSessionInterruption, object: self, queue: .main, using: handleInterruption)

        
        //TODO: Get Permission to Access Music Library in a proper way
        #warning("fix me...LibraryAccessor is a bad name...maybe Library")
        _ = LibaryAcessor.audioBooks()
        
        // Initialize the Google Mobile Ads SDK.
        // Sample AdMob app ID: ca-app-pub-3940256099942544~1458002511
        //"ca-app-pub-3940256099942544/2934735716"
        //AudioWave appID "ca-app-pub-5752720356168981~6412523758"
        //GADMobileAds.configure(withApplicationID: "ca-app-pub-3940256099942544/6300978111" )
        
        //UIApplication.shared.statusBarStyle = .lightContent
        //setupNowPlayingInfoCenter()
        
        return true
    }
    

    
    func applicationWillResignActive(_ application: UIApplication) {
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
    }

    func applicationWillTerminate(_ application: UIApplication) {
    }
}

