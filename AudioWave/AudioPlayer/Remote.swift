//
//  Remote.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-03-01.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import MediaPlayer

//FIXME: Chicken and Egg Siutation Here
class Remote
{
    let commandCenter = MPRemoteCommandCenter.shared() //FIXME: Hidden Dependency
    let audioSource1: AudioSource
    let audioSource2: AudioSource //FIXME: Naming
    let notifications = NotificationCenter.default //FIXME: Hidden Dependency
    let nowPlaying = MPNowPlayingInfoCenter.default //FIXME: Hidden Dependency
    
    init(audioSource1: AudioSource, audioSource2: AudioSource) {
        self.audioSource1 = audioSource1
        self.audioSource2 = audioSource2
        setupRemoteControl()
        notifications.addObserver(self, selector: #selector(refreshInfo), name: .didLoad, object: nil)
    }
    
    func setupRemoteControl() {
        commandCenter.playCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioSource1.play()
            self?.audioSource2.play()
            return .success
        })
        commandCenter.pauseCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioSource1.pause()
            self?.audioSource2.pause()
            return .success
        })
        commandCenter.nextTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioSource1.next()
            self?.audioSource2.next()
            return .success
        })
        commandCenter.previousTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioSource1.previous()
            self?.audioSource2.previous()
            return .success
        })
    }
    
    @objc func refreshInfo() {
        let track1 = audioSource1.track()
        let track2 = audioSource2.track()
        //FIXME: Not great
        guard let artwork = audioSource1.artwork() ?? audioSource2.artwork() else {
            nowPlaying().nowPlayingInfo = [ MPMediaItemPropertyTitle : track1, MPMediaItemPropertyArtist : track2]
            return
        }
        nowPlaying().nowPlayingInfo = [ MPMediaItemPropertyTitle : track1, MPMediaItemPropertyArtist : track2, MPMediaItemPropertyArtwork : artwork]
    }
}
