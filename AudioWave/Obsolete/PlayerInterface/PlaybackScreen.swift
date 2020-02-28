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

#warning("PlaybackScreen is insanely huge...refactor")
class PlaybackScreen: UIViewController
{
    let player: SWAudioPlayer
    let notificationCenter: NotificationCenter
    var volume: Float = 0 { willSet { player.volume = newValue } }  //FIXME: Belong in player
    var timer: Timer? //FIXME: No Mutable State
    
    @IBOutlet weak var containerView: UIView!
    //@IBOutlet weak var descriptionStackView: UIStackView!
    
    init(audioPlayer: SWAudioPlayer, notificationCenter: NotificationCenter) {
        self.player = audioPlayer  //FIXME: Inconsistent Naming
        self.notificationCenter = notificationCenter
        super.init(nibName: "PlaybackScreen", bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { fatalError("Son, just don't") }
    
    //MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupNotifications()
        //self.updateView()
        //self.configureTimer()
        self.view.layer.cornerRadius = 10.0
        self.view.clipsToBounds = true
    }
    
    //MARK: - Notifications
    
    func setupNotifications() {
        self.notificationCenter.addObserver(self, selector: #selector(onTrackChanged), name: NSNotification.Name(rawValue: SWAudioPlayerTrackChangedNotification), object: nil)
        self.notificationCenter.addObserver(self, selector: #selector(onPlaybackStateChanged), name: NSNotification.Name(rawValue: SWAudioPlayerPlaybackStateChangedNotification), object: nil)
        
    }
    
    @objc func onTrackChanged() {
//        if !self.isViewLoaded { return }
//        
//        if self.player.currentPlaybackItem == nil {
//            self.close()
//            return
//        }
//        //self.updateView()
    }
    
    @objc func onPlaybackStateChanged() {
        if !self.isViewLoaded { return }
        //self.updateControls()
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
        transition.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        transition.type = CATransitionType.push
        transition.subtype = convertToOptionalCATransitionSubtype(transitionSubtype)
        
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
        animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        
        layer.add(animation, forKey: "Animation")
    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromCATransitionSubtype(_ input: CATransitionSubtype) -> String {
	return input.rawValue
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertToOptionalCATransitionSubtype(_ input: String?) -> CATransitionSubtype? {
	guard let input = input else { return nil }
	return CATransitionSubtype(rawValue: input)
}
