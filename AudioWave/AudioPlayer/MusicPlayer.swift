//
//  MusicPlayer.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import UIKit
import AVFoundation
import MediaPlayer

class MusicPlayer: AudioPlayer
{

    let commandCenter = MPRemoteCommandCenter.shared() //FIXME: Hidden Dependency
    var state: AudioPlayerState //FIXME: Be Immutable
    var player: AVAudioPlayer?       //FIXME: Be Immutable / Hidden Dependency
    let notifications = NotificationCenter.default
    var mediaItem: MPMediaItem?
    
    init(state: AudioPlayerState) {
        self.state = state
        observeAudioSession()
        setupRemoteControl()
    }
    
    func load(_ mediaItem: MPMediaItem) {
        self.player = try! AVAudioPlayer(contentsOf: mediaItem.assetURL!)   //FIXME: Fragile
        player?.prepareToPlay()
        self.mediaItem = mediaItem
        notifications.post(name: .didLoad, object: self)
    }

    func play() {
        player?.play()
        notifications.post(name: .didPlay, object: self)
    }
    
    func pause() {
        player?.pause()
        notifications.post(name: .didPause, object: self)
    }
    
    func next() {
        //FIXME: load the next one from the playlist
        //FIXME: play if previously playing
        notifications.post(name: .didSkip, object: self)
    }
    
    func previous() {
        //FIXME: load the previous one from the playlist
        //FIXME: play if previously playing
        notifications.post(name: .didPrevious, object: self)
    }
    
    func speed(_ speed: Float) {
        //FIXME:
        fatalError()
    }
    func track() -> String { return "FIXME" }
    func artist() -> String { return "FIXME" }
    func album() -> String { return "FIXME" }
    func playback(mode: PlayMode) { fatalError() }
    
    func artwork() -> MPMediaItemArtwork? {
        return mediaItem?.artwork
    }
    
    
    //FIXME: Volume
    
    func observeAudioSession() {
        notifications.addObserver(self, selector: #selector(handleInterruption), name: AVAudioSession.interruptionNotification, object: nil)
    }
    
    func setupRemoteControl() {
        commandCenter.playCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.play()
            return .success
        })
        commandCenter.pauseCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.pause()
            return .success
        })
        commandCenter.nextTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.next()
            return .success
        })
        commandCenter.previousTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.previous()
            return .success
        })
    }
    
    //FIXME: This is gnarly
    @objc func handleInterruption(notification: Notification) {
        guard let userInfo = notification.userInfo,
            let typeValue = userInfo[AVAudioSessionInterruptionTypeKey] as? UInt,
            let type = AVAudioSession.InterruptionType(rawValue: typeValue) else {
                return
        }
        if type == .began {
            // Interruption began, take appropriate actions
        }
        else if type == .ended {
            if let optionsValue = userInfo[AVAudioSessionInterruptionOptionKey] as? UInt {
                let options = AVAudioSession.InterruptionOptions(rawValue: optionsValue)
                if options.contains(.shouldResume) {
                    // Interruption Ended - playback should resume
                } else {
                    // Interruption Ended - playback should NOT resume
                }
            }
        }
    }
}
