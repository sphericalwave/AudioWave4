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
    let notifications = NotificationCenter.default //FIXME: Hidden Dependency
    let nowPlaying = MPNowPlayingInfoCenter.default //FIXME: Hidden Dependency
    
    init() {
        setupRemoteControl()
        notifications.addObserver(self, selector: #selector(refreshInfo), name: .didLoad, object: nil)
    }
    
    //FIXME: Should be in the init
    func setupRemoteControl() {
        commandCenter.playCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.notifications.post(name: .didPlay, object: nil)
            return .success
        })
        commandCenter.pauseCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.notifications.post(name: .didPause, object: nil)
            return .success
        })
        commandCenter.nextTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.notifications.post(name: .didSkip, object: nil)
            return .success
        })
        commandCenter.previousTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.notifications.post(name: .didPrevious, object: nil)
            return .success
        })
    }
    
    @objc func refreshInfo() {
//        let track1 = audioSource1.track()
//        let track2 = audioSource2.track()
        //FIXME: Not great
//        guard let artwork = audioSource1.artwork() ?? audioSource2.artwork() else {
//            nowPlaying().nowPlayingInfo = [ MPMediaItemPropertyTitle : track1, MPMediaItemPropertyArtist : track2]
//            return
//        }
//        nowPlaying().nowPlayingInfo = [ MPMediaItemPropertyTitle : track1, MPMediaItemPropertyArtist : track2, MPMediaItemPropertyArtwork : artwork]
    }
}
