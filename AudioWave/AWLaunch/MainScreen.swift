//
//  MainScreen.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2019-05-21.
//  Copyright © 2019 SphericalWave. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer


class MainScreen: UIViewController
{
    @IBOutlet weak var pageControl: UIPageControl!
    #warning("move fader into it's own class")
    @IBOutlet weak var fader: UISlider!
    
    #warning("fix me...buttons for playlists")
    //@IBOutlet weak var musicButton: UIBarButtonItem!
    //@IBOutlet weak var booksButton: UIBarButtonItem!
    
    var pageViewController: UIPageViewController!
    
    #warning("fix me static contradict OOP")
    static let documentsDirectory = FileManager().urls(for: .documentDirectory, in: .userDomainMask).first!
    static let sliderURL = URL(fileURLWithPath: "slider", relativeTo: documentsDirectory)
    
    init() {
        super.init(nibName: "MainScreen", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError() }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurePageControl()
        NotificationCenter.default.addObserver(forName: UIApplication.willTerminateNotification, object: nil, queue: .main, using: save)
        restore()
        #warning("move into fader class")
        setupFader()
        self.title = "AudioWave"
        
//        self.booksButton.isEnabled = true
//        self.musicButton.isEnabled = true
        
        configureCommandCenter()
    }
    
    #warning("fix me")
    func configureCommandCenter() {
//        let commandCenter = MPRemoteCommandCenter.shared()
//        commandCenter.playCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
//            //guard let sself = self else { return .commandFailed }
//            self?.musicPlayerVC.player.play()
//            self?.audioBookPlayerVC.player.play()
//            return .success
//        })
//
//        commandCenter.pauseCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
//            //guard let sself = self else { return .commandFailed }
//            self?.musicPlayerVC.player.pause()
//            self?.audioBookPlayerVC.player.pause()
//            return .success
//        })
    }
    
    //MARK: - Nav Buttons
    #warning("fix me")
    @IBAction func repeaterButton(_ sender: Any) {
//        self.pageViewController.setViewControllers([audioBookPlayerVC], direction: .forward, animated: true, completion: nil)
//        let when = DispatchTime.now() + 0.3 // change 2 to desired number of seconds
//        DispatchQueue.main.asyncAfter(deadline: when) {
//            self.audioBookPlayerVC.presentAudiobooksVC()
//        }
//
//
    }
    
    #warning("fix me")

    @IBAction func soundtrackButton(_ sender: Any) {
//        self.pageViewController.setViewControllers([musicPlayerVC], direction: .forward, animated: true, completion: nil)
//        let when = DispatchTime.now() + 0.3 // change 2 to desired number of seconds
//        DispatchQueue.main.asyncAfter(deadline: when) {
//            self.musicPlayerVC.presentMusicPlaylistVC()
//        }
//
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
    
    
    #warning("move somewhere more appropriate")
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
        
//        audioBookPlayerVC.volume = contentVol
//        musicPlayerVC.volume = musicVol
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//
//        guard let identifier = segue.identifier.flatMap(SegueIdentifier.init) else {
//            return
//        }
//        switch identifier {
//        case .embed:
//            if let pageViewController = segue.destination as? UIPageViewController {
//                self.pageViewController = pageViewController
//                self.pageViewController.dataSource = self
//                self.pageViewController.delegate = self
//                self.pageViewController.setViewControllers([audioBookPlayerVC], direction: .forward, animated: false, completion: nil)
//            }
//        }
//    }
    
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


