//
//  PlayerVC.swift
//  AudioWave2
//
//  Created by Aaron Anthony on 2017-06-09.
//  Copyright © 2017 SphericalWave. All rights reserved.
//

//SINGLE RESPONSIBILITY: Connect Things Together

import UIKit
import MediaPlayer
import CoreData
import AVFoundation

class PlaybackScreen: UIViewController {
    
    init(audioPlayer: SWAudioPlayer, notificationCenter: NotificationCenter) {
        super.init(nibName: "PlaybackScreen", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("Son, just don't") }
    
    //MARK: - Vars
    var timer: Timer?
    
    //MARK: - Outlets
    @IBOutlet weak var artworkImageView: UIImageView!
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var nextButton: UIButton!
    @IBOutlet weak var previousButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var elapsedTimeLabel: UILabel!
    @IBOutlet weak var remainingTimeLabel: UILabel!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var descriptionStackView: UIStackView!
    @IBOutlet weak var instructionLabel: UILabel!
    
    @IBOutlet weak var loopButton: IdeaLoopButton!
    @IBOutlet weak var speedButton: SpeedButton!
    @IBAction func loopButtonTap(_ sender: IdeaLoopButton) {
        self.player.loopMode = sender.nextState()
    }
    @IBAction func speedButtonTap(_ sender: SpeedButton) {
        sender.nextState()
        switch sender.speed {
        case .normal:
            self.player.speed = 1
        case .twentyFivePercentFaster:
            self.player.speed = 1.25
        case .fiftyPercentFaster:
            self.player.speed = 1.5
        case .seventyFivePercentFaster:
            self.player.speed = 1.75
        case .hundredPercentFaster:
            self.player.speed = 2
        }
        //self.player.speed(1)
    }
    
    
    
    //MARK: - Dependencies
    var player: SWAudioPlayer!
    var notificationCenter: NotificationCenter!
    
    var volume: Float = 0 {
        willSet {
            player.volume = newValue
        }
    }
    
    //MARK: - View Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard player != nil, notificationCenter != nil else {
            print("Player or Notification Center Not Attached")
            return
        }
        self.setupNotifications()
        self.updateView()
        self.configureTimer()
        
        self.view.layer.cornerRadius = 10.0
        self.view.clipsToBounds = true
        artworkImageView.layer.cornerRadius = 10.0
        artworkImageView.clipsToBounds = true
        slider.setThumbImage(#imageLiteral(resourceName: "ProgressSliderThumb"), for: .normal)
    }
    
    //MARK: - Notifications
    
    func setupNotifications() {
        self.notificationCenter.addObserver(self, selector: #selector(onTrackChanged), name: NSNotification.Name(rawValue: SWAudioPlayerTrackChangedNotification), object: nil)
        self.notificationCenter.addObserver(self, selector: #selector(onPlaybackStateChanged), name: NSNotification.Name(rawValue: SWAudioPlayerPlaybackStateChangedNotification), object: nil)
        
    }
    
    @objc func onTrackChanged() {
        if !self.isViewLoaded { return }
        
        if self.player.currentPlaybackItem == nil {
            self.close()
            return
        }
        
        self.updateView()
    }
    
    @objc func onPlaybackStateChanged() {
        if !self.isViewLoaded { return }
        
        self.updateControls()
    }
    
    //MARK: - Configuration
    
    func configureTimer() {
        self.timer = Timer.every(0.1.seconds) { [weak self] in
            guard let sself = self else { return }
            
            if !sself.slider.isTracking {
                sself.slider.value = Float(sself.player.currentTime ?? 0)
            }
            
            sself.updateTimeLabels()
        }
    }
    
    //MARK: - Actions
    
    @IBAction func playPauseButtonAction(_ sender: AnyObject) {
        self.player.togglePlayPause()
    }
    
    @IBAction func previousButtonAction(_ sender: AnyObject) {
        self.player.previousTrack()
    }
    
    @IBAction func nextButtonAction(_ sender: AnyObject) {
        self.player.nextTrack()
    }
    
    @IBAction func swipeLeftAction(_ sender: AnyObject) {
        if self.player.nextPlaybackItem == nil {
            self.animateNoNextTrackBounce(self.artworkImageView.layer)
            return
        }
        
        self.animateContentChange(kCATransitionFromRight, layer: self.artworkImageView.layer)
        self.player.nextTrack()
    }
    
    @IBAction func swipeRightAction(_ sender: AnyObject) {
        if self.player.previousPlaybackItem == nil {
            self.animateNoPreviousTrackBounce(self.artworkImageView.layer)
            return
        }
        
        self.animateContentChange(kCATransitionFromLeft, layer: self.artworkImageView.layer)
        self.player.previousTrack()
    }
    
    @IBAction func sliderValueChanged(_ sender: AnyObject) {
        self.player.seekTo(Double(self.slider.value))
    }
    
    @IBAction func closeAction(_ sender: AnyObject) {
        self.close()
    }
    
    func close() {
        self.dismiss(animated: true, completion: nil)
    }
    
    //MARK: - Update
    
    func updateView() {
        self.updateArtworkImageView()
        self.updateSlider()
        self.updateInfoLabels()
        self.updateTimeLabels()
        self.updateControls()
        self.updateSpeedAndLoop()
    }
    
    func updateArtworkImageView() {
        self.artworkImageView.image = self.player.currentPlaybackItem?.artwork?.image(at: artworkImageView.frame.size) //UIImage(named: self.player.currentPlaybackItem?.albumImageName ?? "")
    }
    
    func updateSlider() {
        self.slider.minimumValue = 0
        self.slider.maximumValue = Float(self.player.duration ?? 0)
    }
    
    func updateInfoLabels() {
        if self.player.currentPlaybackItem != nil {
            self.titleLabel.text = "\(self.player.currentPlaybackItem?.artist ?? "") - \(self.player.currentPlaybackItem?.title ?? "")"
            self.descriptionLabel.text = "\(self.player.currentPlaybackItem?.albumTitle ?? "")"
        }
        else {
            self.titleLabel.text = ""
            self.descriptionLabel.text = ""
        }
    }
    
    func updateTimeLabels() {
        if let currentTime = self.player.currentTime, let duration = self.player.duration {
            self.elapsedTimeLabel.text = self.humanReadableTimeInterval(currentTime)
            self.remainingTimeLabel.text = "-" + self.humanReadableTimeInterval(duration - currentTime)
        }
        else {
            self.elapsedTimeLabel.text = ""
            self.remainingTimeLabel.text = ""
        }
    }
    
    func updateControls() {
        self.playPauseButton.isSelected = self.player.isPlaying
        self.nextButton.isEnabled = self.player.nextPlaybackItem != nil
        self.previousButton.isEnabled = self.player.previousPlaybackItem != nil
    }
    
    func updateSpeedAndLoop() {
        switch player.speed {
        case 1:
            speedButton.speed = .normal
        case 1.25:
            speedButton.speed = .twentyFivePercentFaster
        case 1.5:
            speedButton.speed = .fiftyPercentFaster
        case 1.75:
            speedButton.speed = .seventyFivePercentFaster
        case 2:
            speedButton.speed = .hundredPercentFaster
        default:
            speedButton.speed = .normal
        }
        switch player.loopMode {
        case .repeatOne:
            loopButton.loopMode = .repeatOne
        case .repeatAll:
            loopButton.loopMode = .repeatAll
        case .random:
            loopButton.loopMode = .random
        }
    }
    
    //MARK: - Convenience
    
    func humanReadableTimeInterval(_ timeInterval: TimeInterval) -> String {
        let timeInt = Int(round(timeInterval))
        let (hh, mm, ss) = (timeInt / 3600, (timeInt % 3600) / 60, (timeInt % 3600) % 60)
        
        let hhString: String? = hh > 0 ? String(hh) : nil
        let mmString = (hh > 0 && mm < 10 ? "0" : "") + String(mm)
        let ssString = (ss < 10 ? "0" : "") + String(ss)
        
        return (hhString != nil ? (hhString! + ":") : "") + mmString + ":" + ssString
    }
    
    func animateContentChange(_ transitionSubtype: String, layer: CALayer) {
        let transition = CATransition()
        
        transition.duration = 0.25
        transition.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        transition.type = kCATransitionPush
        transition.subtype = transitionSubtype
        
        layer.add(transition, forKey: kCATransition)
    }
    
    func animateNoPreviousTrackBounce(_ layer: CALayer) {
        self.animateBounce(fromValue: NSNumber(value: 0 as Int), toValue: NSNumber(value: 25 as Int), layer: layer)
    }
    
    func animateNoNextTrackBounce(_ layer: CALayer) {
        self.animateBounce(fromValue: NSNumber(value: 0 as Int), toValue: NSNumber(value: -25 as Int), layer: layer)
    }
    
    func animateBounce(fromValue: NSNumber, toValue: NSNumber, layer: CALayer) {
        let animation = CABasicAnimation(keyPath: "transform.translation.x")
        animation.fromValue = fromValue
        animation.toValue = toValue
        animation.duration = 0.1
        animation.repeatCount = 1
        animation.autoreverses = true
        animation.isRemovedOnCompletion = true
        animation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        
        layer.add(animation, forKey: "Animation")
    }
    
    func presentMusicPlaylistVC() {
        //Storyboard Init
        //let storyboard = UIStoryboard.init(name: "MusicPlaylists", bundle: nil)
        //let nav = storyboard.instantiateInitialViewController() as! UINavigationController
        //let musicPlaylists = nav.topViewController as! MusicPlayerContainerVC
        let musicPlaylistsVC = MusicPlaylistsVC(style: .plain)
        musicPlaylistsVC.player = player
        let nav = UINavigationController(rootViewController: musicPlaylistsVC)
        //nav.navigationBar.barStyle = .blackOpaque
        
        //Initialize Properties
        //            musicPlaylists.didSelectPlayable = { playableItem, index in
        //                self.load(playable: playableItem, at: index)
        //                self.play()
        //            }
        self.present(nav, animated: true, completion: nil)
    }
    
    func presentAudiobooksVC() {
        //Storyboard Init
        //let storyboard = UIStoryboard.init(name: "MusicPlaylists", bundle: nil)
        //let nav = storyboard.instantiateInitialViewController() as! UINavigationController
        //let musicPlaylists = nav.topViewController as! MusicPlayerContainerVC
        let audioBooksVC = AudioBooksVC(style: .plain)
        audioBooksVC.player = player
        let nav = UINavigationController(rootViewController: audioBooksVC)
        //nav.navigationBar.barStyle = .blac
        
        //Initialize Properties
        //            musicPlaylists.didSelectPlayable = { playableItem, index in
        //                self.load(playable: playableItem, at: index)
        //                self.play()
        //            }
        self.present(nav, animated: true, completion: nil)
    }
}
