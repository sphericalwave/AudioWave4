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
    let audioPlayer1: AudioPlayer
    let audioPlayer2: AudioPlayer
    
    init(audioPlayer1: AudioPlayer, audioPlayer2: AudioPlayer) {
        self.audioPlayer1 = audioPlayer1
        self.audioPlayer2 = audioPlayer2
        setupRemoteControl()
    }
    
    func setupRemoteControl() {
        commandCenter.playCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioPlayer1.play()
            self?.audioPlayer2.play()
            return .success
        })
        commandCenter.pauseCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioPlayer1.pause()
            self?.audioPlayer2.pause()
            return .success
        })
        commandCenter.nextTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioPlayer1.next()
            self?.audioPlayer2.next()
            return .success
        })
        commandCenter.previousTrackCommand.addTarget (handler: { [weak self] event -> MPRemoteCommandHandlerStatus in
            self?.audioPlayer1.previous()
            self?.audioPlayer2.previous()
            return .success
        })
    }
}
