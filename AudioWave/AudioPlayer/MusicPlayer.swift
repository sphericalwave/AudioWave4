//
//  MusicPlayer.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-02-28.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import Foundation
import AVFoundation
import MediaPlayer

class MusicPlayer: AudioPlayer
{
    let commandCenter = MPRemoteCommandCenter.shared() //FIXME: Hidden Dependency
    var state: AudioPlayerState //FIXME: Be Immutable
    var player: AVAudioPlayer!       //FIXME: Be Immutable / Hidden Dependency
    
    init(state: AudioPlayerState) {
        self.state = state
        observeAudioSession()
        setupRemoteControl()
    }
    
    func play(_ mediaItem: MPMediaItem) {
        self.player = try! AVAudioPlayer(contentsOf: mediaItem.assetURL!)   //FIXME: Fragile
        player.prepareToPlay()
        player.play()
    }

    func play() {
       // queuePlayer.play()
    }
    
    func pause() {
        // queuePlayer.pause()
    }
    
    func next() {
        // queuePlayer.advanceToNextItem()
    }
    
    func previous() {
        fatalError()    //FIXME: Implement Previous Track
    }
    
    func observeAudioSession() {
        NotificationCenter.default.addObserver(self, selector: #selector(handleInterruption), name: AVAudioSession.interruptionNotification, object: nil)
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
