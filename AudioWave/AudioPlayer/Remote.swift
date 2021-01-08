//
//  Remote.swift
//  AudioWave
//
//  Created by Aaron Anthony on 2020-03-01.
//  Copyright © 2020 SphericalWave. All rights reserved.
//

import MediaPlayer

//FIXME: Chicken and Egg Siutation Here
final class Remote
{
    private let commandCenter = MPRemoteCommandCenter.shared() //FIXME: Hidden Dependency
    private let audioSource1: AudioSource
    private let audioSource2: AudioSource
    private let notifications = NotificationCenter.default //FIXME: Hidden Dependency
    private let nowPlaying = MPNowPlayingInfoCenter.default() //FIXME: Hidden Dependency

    private var audioSources: [AudioSource] {
        [audioSource1, audioSource2]
    }

    init(audioSource1: AudioSource, audioSource2: AudioSource) {
        self.audioSource1 = audioSource1
        self.audioSource2 = audioSource2
        setupRemoteControl()
        notifications.addObserver(self, selector: #selector(refreshInfo), name: .didLoad, object: nil)
    }
    
    private func setupRemoteControl() {
        commandCenter.playCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioSources.forEach { $0.play() }
            return .success
        })
        commandCenter.pauseCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioSources.forEach { $0.pause() }
            return .success
        })
        commandCenter.nextTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioSources.forEach { $0.next() }
            return .success
        })
        commandCenter.previousTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioSources.forEach { $0.previous() }
            return .success
        })
    }
    
    @objc
    private func refreshInfo() {
        nowPlaying.nowPlayingInfo = [
            MPMediaItemPropertyTitle : audioSource1.track(),
            MPMediaItemPropertyArtist : audioSource2.track(),
        ]

        if let artwork = audioSource1.artwork ?? audioSource2.artwork {
            nowPlaying.nowPlayingInfo?[MPMediaItemPropertyArtwork] = artwork
        }
    }
}
