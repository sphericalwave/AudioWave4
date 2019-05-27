//
//  ContainerViewController.swift
//  AudioWave2
//
//  Created by Jacob Christie on 2017-06-22.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer


class SWCrossFaderVC: UIViewController {
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let sliderURL = URL(fileURLWithPath: "slider", relativeTo: documentsDirectory)
    
    enum SegueIdentifier: String {
        case embed
    }
    
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var fader: UISlider!
    
    @IBOutlet weak var musicButton: UIBarButtonItem!
    @IBOutlet weak var booksButton: UIBarButtonItem!
    
    var pageViewController: UIPageViewController!
    
    lazy var musicPlayerVC: PlaybackScreen = {
        let playerStoryboard = UIStoryboard.init(name: "MusicPlayer", bundle: nil)
        let vc = playerStoryboard.instantiateInitialViewController() as! PlaybackScreen
        
        
        let audioSession = AVAudioSession.sharedInstance()
        let commandCenter = MPRemoteCommandCenter.shared()
        let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
        let notificationCenter = NotificationCenter.default
        let musicPlayer = SWAudioPlayer(dependencies: (audioSession, commandCenter, nowPlayingInfoCenter, notificationCenter, true))
        //musicPlayer.isMusicPlayer = true
        musicPlayer.restore()
        
        vc.player = musicPlayer
        vc.notificationCenter = notificationCenter
        vc.title = "Background Music"
        
        return vc
    }()
    
    var audioBookPlayerVC: PlaybackScreen = {
        let storyboard = UIStoryboard.init(name: "MusicPlayer", bundle: nil)
        let vc = storyboard.instantiateInitialViewController() as! PlaybackScreen
        
        let audioSession = AVAudioSession.sharedInstance()
        let commandCenter = MPRemoteCommandCenter.shared()
        let nowPlayingInfoCenter = MPNowPlayingInfoCenter.default()
        let notificationCenter = NotificationCenter.default
        let musicPlayer = SWAudioPlayer(dependencies: (audioSession, commandCenter, nowPlayingInfoCenter, notificationCenter, false))
        //musicPlayer.isMusicPlayer = false
        musicPlayer.restore()
        
        vc.player = musicPlayer
        vc.notificationCenter = notificationCenter
        vc.title = "Audio Content"
        
        //let vc = nav.topViewController as! PlayerVC
        //vc.isMusicPlayer = false

//        let audioBookPlayer = AudioBookPlayer()
//        audioBookPlayer.delegate = vc
//        vc.player = audioBookPlayer
        return vc
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
        NotificationCenter.default.addObserver(forName: .UIApplicationWillTerminate, object: nil, queue: .main, using: save)
        restore()
        setupFader()
        self.title = "AudioWave"
        
        self.booksButton.isEnabled = true
        self.musicButton.isEnabled = true
        
        configureCommandCenter()
    }
    
    func configureCommandCenter() {
        let commandCenter = MPRemoteCommandCenter.shared()
        commandCenter.playCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            //guard let sself = self else { return .commandFailed }
            self?.musicPlayerVC.player.play()
            self?.audioBookPlayerVC.player.play()
            return .success
        })
        
        commandCenter.pauseCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            //guard let sself = self else { return .commandFailed }
            self?.musicPlayerVC.player.pause()
            self?.audioBookPlayerVC.player.pause()
            return .success
        })
    }
    
    //MARK: - Nav Buttons
    @IBAction func repeaterButton(_ sender: Any) {
        self.pageViewController.setViewControllers([audioBookPlayerVC], direction: .forward, animated: true, completion: nil)
        let when = DispatchTime.now() + 0.3 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.audioBookPlayerVC.presentAudiobooksVC()
        }
        

    }
    
    @IBAction func soundtrackButton(_ sender: Any) {
        self.pageViewController.setViewControllers([musicPlayerVC], direction: .forward, animated: true, completion: nil)
        let when = DispatchTime.now() + 0.3 // change 2 to desired number of seconds
        DispatchQueue.main.asyncAfter(deadline: when) {
            self.musicPlayerVC.presentMusicPlaylistVC()
        }

    }
    
    //MARK: - Page Control
    private func configurePageControl() {
        self.pageControl.currentPage = 0
        self.pageControl.numberOfPages = 2
        self.pageControl.currentPageIndicatorTintColor = .black
        self.pageControl.pageIndicatorTintColor = .lightGray
    }
    
    //MARK: - Fader
    private func setupFader() {
        fader.setThumbImage(#imageLiteral(resourceName: "Fader3"), for: .normal)
        //fader.setMaximumTrackImage(#imageLiteral(resourceName: "transparentSlider"), for: .normal)
        //fader.setMinimumTrackImage(#imageLiteral(resourceName: "transparentSlider"), for: .normal)
    }
    
    
    
    @IBAction func faderChanged(_ sender: UISlider) {
        /*
         returns a float array with two indexes representing the volumes of the left (index 0) and right (index 1) channels
         when t is -1, volumes[0] = 0, volumes[1] = 1
         when t = 0, volumes[0] = 0.707, volumes[1] = 0.707 (equal-power cross fade)
         when t = 1, volumes[0] = 1, volumes[1] = 0
         */
        
        var contentVol: Float = 0
        var musicVol: Float = 0
        let s = sender.value
        
        //Log Cross Fader
//        let musicVol = (0.5 * (0.9 + s) ).squareRoot()  //Not Necessarily Ideal
//        let contentVol = (0.5 * (1 - s) ).squareRoot()
        
        if s < -0.0414 {
            contentVol = 1
            musicVol = 0.707 + 0.707 * s
        }
        if s > -0.0414, s < 0.0414 {
            contentVol = 0.707 - 0.707 * s
            musicVol = 0.707 + 0.707 * s
        }
        if s > 0.0414 {
            contentVol = 0.707 - 0.707 * s
            musicVol = 1
        }
        
        audioBookPlayerVC.volume = contentVol
        musicPlayerVC.volume = musicVol
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let identifier = segue.identifier.flatMap(SegueIdentifier.init) else {
            return
        }
        switch identifier {
        case .embed:
            if let pageViewController = segue.destination as? UIPageViewController {
                self.pageViewController = pageViewController
                self.pageViewController.dataSource = self
                self.pageViewController.delegate = self
                self.pageViewController.setViewControllers([audioBookPlayerVC], direction: .forward, animated: false, completion: nil)
            }
        }
    }
    
    // MARK: - Archiving
    func save(_ notification: Notification) {
        let saveSucceeded = NSKeyedArchiver.archiveRootObject(fader.value, toFile: SWCrossFaderVC.sliderURL.path)
        if !saveSucceeded {
            fatalError("Failed to save musicPlayer state...")
        }
    }
    
    func restore() {
        guard let value = NSKeyedUnarchiver.unarchiveObject(withFile: SWCrossFaderVC.sliderURL.path) as? Float else {
            return
        }
        fader.value = value
        self.faderChanged(fader)
    }
}


extension SWCrossFaderVC: UIPageViewControllerDataSource {
    
    //Content Player VC
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard viewController == musicPlayerVC else {
            return nil
        }
        return self.audioBookPlayerVC
    }
    
    //MusicPlayer VC
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard viewController == audioBookPlayerVC else {
            return nil
        }
        return self.musicPlayerVC
    }
}

extension SWCrossFaderVC: UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
        pageControl.currentPage = (previousViewControllers[0] == audioBookPlayerVC) ? 1 : 0
        
        //TODO: Put This In a More Relevant Place?
//        switch pageControl.currentPage {
//        case 0:
//            //self.booksButton.isEnabled = true
//            //musicButton.isEnabled = false
//        case 1:
//            
//            //self.booksButton.isEnabled = false
//            //musicButton.isEnabled = true
//        default:
//            fatalError()
//        }
        
        
    }
}
